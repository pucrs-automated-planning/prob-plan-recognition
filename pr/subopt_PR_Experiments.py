#!/usr/bin/python
import sys, os, csv, time
from options import Program_Options
import benchmark
from operator import attrgetter

def custom_partition( s, sep ) :
	i = 0
	while i < len(s) :
		if s[i] == sep : break
		i = i + 1
	if i == len(s) : return (None,None,None)
	if i == 0 : return ( None, s[i], s[i+1:] )
	return ( s[:i-1], s[i], s[i+1:] )

class PR_Command :

	def __init__( self, domain, problem, simple=True, bfs=False, max_time = 120, max_mem = 2048 ) :
		self.domain = domain
		self.problem = problem
		self.simple = simple
		self.bfs = bfs
		self.noext_problem = os.path.basename(self.problem).replace( '.pddl', '' )
		self.max_time = max_time
		self.max_mem = max_mem
		self.num_accounted_obs = 'n/a' 

	def execute( self ) :
		if self.simple :
			cmd_string = './subopt_PR -d %s -i %s -I'%( self.domain, self.problem)
		else :
			if self.bfs :
				cmd_string = './subopt_PR -d %s -i %s -B'%( self.domain, self.problem)
			else :
				cmd_string = './subopt_PR -d %s -i %s'%( self.domain, self.problem)
		self.log = benchmark.Log( '%s.log'%self.noext_problem )
		self.signal, self.time = benchmark.run( cmd_string, self.max_time, self.max_mem, self.log )
		self.gather_data()

	def gather_data( self ) :
		if self.signal == 0 and os.path.exists( 'hyp-rank' ) :
			instream = open( 'hyp-rank' )
			for line in instream :
				line = line.strip()
				if not '--' in line:
					self.num_obs_accounted = int(line)
			instream.close()

	def write_result( self, filename ) :
		res = csv.writer(  open( '%s'%filename, 'w' ) )
		res.writerow( [ os.path.basename(self.domain), os.path.basename(self.problem), self.signal, self.time, self.num_accounted_obs ] )


class Translate_Command :
	
	def __init__( self, domain, problem, obs, max_time = 1800, max_mem = 2048 ) :
		self.domain = domain
		self.problem = problem
		self.obs_stream = obs
		self.max_time = max_time
		self.max_mem = max_mem

	def execute( self ) :
		cmd_string = './pr2plan -d %s -i %s -o %s'%(self.domain, self.problem, self.obs_stream)
		self.log = benchmark.Log( '%s_%s_%s_transcription.log'%(self.domain, self.problem, self.obs_stream) )
		self.signal, self.time = benchmark.run( cmd_string, self.max_time, self.max_mem, self.log )

class Hypothesis :
	
	def __init__( self ) :
		self.atoms = []
		self.Delta = 0.0
		self.plan = []
		self.test_failed = False
		self.trans_time = 0.0
		self.plan_time = 0.0
		self.total_time = 0.0
		self.is_true = True

	def test( self, index, do_simple, do_bfs ) :
		# generate the problem with G=H
		hyp_problem = 'hyp_%d_problem.pddl'%index
		self.generate_pddl_for_hyp_plan( hyp_problem )
		# derive problem with G_Obs
		trans_cmd = Translate_Command( 'domain.pddl', hyp_problem, 'obs.dat' )
		trans_cmd.execute()
		os.system( 'mv -f pr-domain.pddl pr-domain-hyp-%d.pddl'%index )
		os.system( 'mv -f pr-problem.pddl pr-problem-hyp-%d.pddl'%index )
		plan_for_H_cmd = PR_Command( 'pr-domain-hyp-%d.pddl'%index, 'pr-problem-hyp-%d.pddl'%index, do_simple, do_bfs )
		plan_for_H_cmd.execute()
		self.trans_time = trans_cmd.time
		self.plan_time = plan_for_H_cmd.time
		self.total_time = trans_cmd.time + plan_for_H_cmd.time 
		plan_for_H_cmd.write_result( 'hyp_%d_planning_H.csv'%index)
		if plan_for_H_cmd.signal == 0  :
			self.score = float( plan_for_H_cmd.num_obs_accounted)
			#self.load_plan( 'pr-problem-hyp-%d.soln'%index )
			if os.path.exists('pr-problem-hyp-%d.soln'%index):
				self.load_plan( 'pr-problem-hyp-%d.soln'%index )
			else : self.test_failed = True
		else :
			self.test_failed = True

	def load_plan( self, plan_name ) :
		instream = open( plan_name )
		self.plan = []
		for line in instream :
			line = line.strip()
			if line[0] == ';' : continue
			#_, _, stuff = line.partition(':')
			#op, _, _ = stuff.partition('[')
			_, _, stuff = custom_partition( line, ':' )
			op, _, _ = custom_partition( stuff, '[' )
			self.plan.append( op.strip().upper() )	
		instream.close()


	def generate_pddl_for_hyp_plan( self, out_name ) :
		instream = open( 'template.pddl' )
		outstream = open( out_name, 'w' )

		for line in instream :
			line = line.strip()
			if '<HYPOTHESIS>' not in line :
				print >> outstream, line
			else :
				for atom in self.atoms :
					print >> outstream, atom
		
		outstream.close()
		instream.close()

	def check_if_actual( self ) :
		real_hyp_atoms = []
		instream = open( 'real_hyp.dat' )
		for line in instream :
			real_hyp_atoms = [ tok.strip() for tok in line.split(',') ]
		instream.close()

		for atom in real_hyp_atoms :
			if not atom in self.atoms :
				self.is_true = False
				break

def load_hypotheses() :

	hyps = []
	
	instream = open( 'hyps.dat' )
	
	for line in instream :
		line = line.strip()
		H = Hypothesis()
		H.atoms = [  tok.strip() for tok in line.split(',') ]
		H.check_if_actual()
		hyps.append( H )

	instream.close()

	return hyps
	
def write_report( experiment, hyps ) :
	
	outstream = open( 'report.txt', 'w' )
	
	print >> outstream, "Experiment=%s"%experiment
	print >> outstream, "Num_Hyp=%d"%len(hyps)
	for hyp in hyps :
		print >> outstream, "Hyp_Atoms=%s"%",".join( hyp.atoms )
		if hyp.test_failed :
			print >> outstream, "Hyp_Score=unknown"
			print >> outstream, "Hyp_Plan_Len=unknown"
		else :
			print >> outstream, "Hyp_Score=%f"%hyp.score
			print >> outstream, "Hyp_Plan_Len=%d"%len(hyp.plan)
		print >> outstream, "Hyp_Trans_Time=%f"%hyp.trans_time
		print >> outstream, "Hyp_Plan_Time=%f"%hyp.plan_time
		print >> outstream, "Hyp_Test_Time=%f"%hyp.total_time
		print >> outstream, "Hyp_Is_True=%s"%hyp.is_true

	outstream.close()
	print max(hyps)

def blocksWorld(observability, useFilteringMethod, threshold):
	totalProblems = 0
	counterProblems = 0
	counterTruePositivePoblems = 0
	counterFalsePositivePoblems = 0
	startTime = time.time()
	candidateGoals = 0
	experimentsResult = ''
	for obs in observability:
		startTime = time.time()
		counterProblems = 0
		counterTruePositivePoblems = 0
		counterFalsePositivePoblems = 0
		candidateGoals = 0
		for problem in range(1, 4) :
			for problemHyp in range(0, 5) :
				for problemObs in range(0, 1) :
					cmdClean = 'rm -rf *.pddl *.dat *.log *.soln *.csv report.txt results.tar.bz2'
					os.system(cmdClean)

					if useFilteringMethod:
						if obs == 'full':
							planRecognitionProblem = 'experiments/blocks-world/block-words-aaai_p0' + str(problem) + '_hyp-' + str(problemHyp) + '_' + 'full.tar.bz2'
						else : planRecognitionProblem = 'experiments/blocks-world/block-words-aaai_p0' + str(problem) + '_hyp-' + str(problemHyp) + '_' +  str(obs) + '_' + str(problemObs) + '.tar.bz2'
						
						print '-> FILTERING CANDIDATE GOALS'
						cmdJar = 'java -jar planrecognizer-filter1.43.jar ' + planRecognitionProblem  + ' ' + threshold
						print cmdJar
						os.system(cmdJar)

					if obs == 'full':
						planRecognitionProblem = 'experiments/blocks-world/block-words-aaai_p0' + str(problem) + '_hyp-' + str(problemHyp) + ('_full_FILTERED.tar.bz2' if useFilteringMethod else '_full.tar.bz2')
					else : planRecognitionProblem = 'experiments/blocks-world/block-words-aaai_p0' + str(problem) + '_hyp-' + str(problemHyp) + '_' + str(obs) + '_' + str(problemObs) + ('_FILTERED.tar.bz2' if useFilteringMethod else '.tar.bz2')

					print planRecognitionProblem
					counterProblems = counterProblems + 1
					args = ['-s', '-e', planRecognitionProblem]
					options = Program_Options( args )

					hyps = load_hypotheses()
					candidateGoals = candidateGoals + len(hyps)
					
					for i in range( 0, len(hyps) ) :
						hyps[i].test(i, options.simple_pr, options.bfs)

					hyp = None
					for h in hyps:
						if not h.test_failed:
							if not hyp or h.score > hyp.score:
								hyp = h

					realHyp = None
					for h in hyps:
						if h.is_true:
							realHyp = h
							break

					for h in hyps:
						if h.test_failed or (h.score == hyp.score and h != realHyp):
							counterFalsePositivePoblems = counterFalsePositivePoblems + 1

					if hyp and realHyp and hyp.score == realHyp.score :
						counterTruePositivePoblems = counterTruePositivePoblems + 1	

		for problem in range(1, 4) :
			for problemHyp in range(0, 20) :
				for problemObs in range(0, 3) :
					cmdClean = 'rm -rf *.pddl *.dat *.log *.soln *.csv report.txt results.tar.bz2'
					os.system(cmdClean)

					if useFilteringMethod:
						if obs == 'full':
							planRecognitionProblem = 'experiments/blocks-world/block-words_p0' + str(problem) + '_hyp-' + str(problemHyp) + '_' + 'full.tar.bz2'
						else : planRecognitionProblem = 'experiments/blocks-world/block-words_p0' + str(problem) + '_hyp-' + str(problemHyp) + '_' +  str(obs) + '_' + str(problemObs) + '.tar.bz2'
						
						print '-> FILTERING CANDIDATE GOALS'
						cmdJar = 'java -jar planrecognizer-filter1.43.jar ' + planRecognitionProblem  + ' ' + threshold
						print cmdJar
						os.system(cmdJar)

					if obs == 'full':
						planRecognitionProblem = 'experiments/blocks-world/block-words_p0' + str(problem) + '_hyp-' + str(problemHyp) + ('_full_FILTERED.tar.bz2' if useFilteringMethod else '_full.tar.bz2')
					else : planRecognitionProblem = 'experiments/blocks-world/block-words_p0' + str(problem) + '_hyp-' + str(problemHyp) + '_' + str(obs) + '_' + str(problemObs) + ('_FILTERED.tar.bz2' if useFilteringMethod else '.tar.bz2')
					
					print planRecognitionProblem
					counterProblems = counterProblems + 1
					args = ['-s', '-e', planRecognitionProblem]
					options = Program_Options( args )

					hyps = load_hypotheses()
					candidateGoals = candidateGoals + len(hyps)
					
					for i in range( 0, len(hyps) ) :
						hyps[i].test(i, options.simple_pr, options.bfs)

					hyp = None
					for h in hyps:
						if not h.test_failed:
							if not hyp or h.score > hyp.score:
								hyp = h

					realHyp = None
					for h in hyps:
						if h.is_true:
							realHyp = h
							break

					for h in hyps:
						if h.test_failed or (h.score == hyp.score and h != realHyp):
							counterFalsePositivePoblems = counterFalsePositivePoblems + 1

					if hyp and realHyp and hyp.score == realHyp.score :
						counterTruePositivePoblems = counterTruePositivePoblems + 1

					if obs == 'full':
						break

		for problem in range(4, 8) :
			for problemHyp in range(1, 5) :
				for problemObs in range(1, 4) :
					cmdClean = 'rm -rf *.pddl *.dat *.log *.soln *.csv report.txt results.tar.bz2'
					os.system(cmdClean)

					if useFilteringMethod:
						if obs == 'full':
							planRecognitionProblem = 'experiments/blocks-world/block-words_p0' + str(problem) + '_hyp-' + str(problemHyp) + '_' + 'full.tar.bz2'
						else : planRecognitionProblem = 'experiments/blocks-world/block-words_p0' + str(problem) + '_hyp-' + str(problemHyp) + '_' +  str(obs) + '_' + str(problemObs) + '.tar.bz2'
						
						print '-> FILTERING CANDIDATE GOALS'
						cmdJar = 'java -jar planrecognizer-filter1.43.jar ' + planRecognitionProblem  + ' ' + threshold
						print cmdJar
						os.system(cmdJar)

					if obs == 'full':
						planRecognitionProblem = 'experiments/blocks-world/block-words_p0' + str(problem) + '_hyp-' + str(problemHyp) + ('_full_FILTERED.tar.bz2' if useFilteringMethod else '_full.tar.bz2')
					else : planRecognitionProblem = 'experiments/blocks-world/block-words_p0' + str(problem) + '_hyp-' + str(problemHyp) + '_' + str(obs) + '_' + str(problemObs) + ('_FILTERED.tar.bz2' if useFilteringMethod else '.tar.bz2')
					
					print planRecognitionProblem
					counterProblems = counterProblems + 1
					args = ['-s', '-e', planRecognitionProblem]
					options = Program_Options( args )

					hyps = load_hypotheses()
					candidateGoals = candidateGoals + len(hyps)
					
					for i in range( 0, len(hyps) ) :
						hyps[i].test(i, options.simple_pr, options.bfs)

					hyp = None
					for h in hyps:
						if not h.test_failed:
							if not hyp or h.score > hyp.score:
								hyp = h

					realHyp = None
					for h in hyps:
						if h.is_true:
							realHyp = h
							break

					for h in hyps:
						if h.test_failed or (h.score == hyp.score and h != realHyp):
							counterFalsePositivePoblems = counterFalsePositivePoblems + 1

					if hyp and realHyp and hyp.score == realHyp.score :
						counterTruePositivePoblems = counterTruePositivePoblems + 1

					if obs == 'full':
						break

		totalCandidateGoals = float(candidateGoals / counterProblems)
		counterProblems = float(counterProblems)
		counterTruePositivePoblems = float(counterTruePositivePoblems)
		trueNegativeCounter = float((counterProblems*(candidateGoals / counterProblems)) - counterFalsePositivePoblems)
		trueNegativeCounter = float(trueNegativeCounter)
		falseNegativeCounter = float(counterProblems - counterTruePositivePoblems)
		accuracy = float(counterTruePositivePoblems / counterProblems)
		precision = float(counterTruePositivePoblems / (counterTruePositivePoblems + counterFalsePositivePoblems))
		recall = float(counterTruePositivePoblems / (counterTruePositivePoblems + falseNegativeCounter))
		f1score = 2 * ( (precision*recall) / (precision+recall) )
		fallout = counterFalsePositivePoblems / (trueNegativeCounter + counterFalsePositivePoblems)
		missrate = float(falseNegativeCounter / (falseNegativeCounter + counterTruePositivePoblems))
		totalT = (time.time() - startTime)
		totalTime = float(totalT / counterProblems)
		avgRecognizedGoals = float((counterFalsePositivePoblems+counterTruePositivePoblems)/counterProblems)

		result = obs + '\t' + str(accuracy) + '\t' + str(precision) + '\t' + str(recall) + '\t' + str(f1score) + '\t' + str(fallout) + '\t' + str(missrate) + '\t' + str(avgRecognizedGoals) + '\t' + str(totalTime) + '\n';
		experimentsResult = experimentsResult + result
		totalProblems = totalProblems + counterProblems

	resultFileName = 'blocks-planrecognition-ramirezgeffner.txt'
	if useFilteringMethod:
		resultFileName = 'blocks-planrecognition-ramirezgeffner+filter-' + str(threshold) +'.txt'

	print experimentsResult
	print '$> Total Problems: ' + str(totalProblems)
	fileResult = open(resultFileName, 'w')
	fileResult.write(experimentsResult)

def campus(observability, useFilteringMethod, threshold):
	totalProblems = 0
	counterProblems = 0
	counterTruePositivePoblems = 0
	counterFalsePositivePoblems = 0
	startTime = time.time()
	candidateGoals = 0
	experimentsResult = ''
	pbBegin = 0
	pbEnd = 0
	for obs in observability:
		startTime = time.time()
		counterProblems = 0
		counterTruePositivePoblems = 0
		counterFalsePositivePoblems = 0
		candidateGoals = 0
		
		if obs == '10':
			pbBegin = 1
			pbEnd = 16
		elif obs == '30':
			pbBegin = 16
			pbEnd = 31
		elif obs == '50':
			pbBegin = 31
			pbEnd = 46
		elif obs == '70':
			pbBegin = 46
			pbEnd = 61
		elif obs == 'full':
			pbBegin = 61
			pbEnd = 76
		
		for problem in range(pbBegin, pbEnd) :
			cmdClean = 'rm -rf *.pddl *.dat *.log *.soln *.csv report.txt results.tar.bz2'
			os.system(cmdClean)
			
			if useFilteringMethod:
				if obs == 'full':
					planRecognitionProblem = 'experiments/campus/bui-campus_generic_hyp-0' + '_full_' + str(problem) + '.tar.bz2'
				else : planRecognitionProblem = 'experiments/campus/bui-campus_generic_hyp-0' + '_' + str(obs) + '_' + str(problem) + '.tar.bz2'
				
				print '-> FILTERING CANDIDATE GOALS'
				cmdJar = 'java -jar planrecognizer-filter1.43.jar ' + planRecognitionProblem  + ' ' + threshold
				print cmdJar
				os.system(cmdJar)

			if obs == 'full':
				planRecognitionProblem = 'experiments/campus/bui-campus_generic_hyp-0' + '_full_' + str(problem) + ('_FILTERED.tar.bz2' if useFilteringMethod else '_full.tar.bz2')
			else : planRecognitionProblem = 'experiments/campus/bui-campus_generic_hyp-0' + '_' + str(obs) + '_' + str(problem) + ('_FILTERED.tar.bz2' if useFilteringMethod else '.tar.bz2')
			
			print planRecognitionProblem
			counterProblems = counterProblems + 1
			args = ['-s', '-e', planRecognitionProblem]
			options = Program_Options( args )

			hyps = load_hypotheses()
			candidateGoals = candidateGoals + len(hyps)

			for i in range( 0, len(hyps) ) :
				hyps[i].test(i, options.simple_pr, options.bfs)

			hyp = None
			for h in hyps:
				if not h.test_failed:
					if not hyp or h.score > hyp.score:
						hyp = h

			realHyp = None
			for h in hyps:
				if h.is_true:
					realHyp = h
					break

			for h in hyps:
				if h.test_failed or (h.score == hyp.score and h != realHyp):
					counterFalsePositivePoblems = counterFalsePositivePoblems + 1

			if hyp and realHyp and hyp.score == realHyp.score :
				counterTruePositivePoblems = counterTruePositivePoblems + 1
		
		totalCandidateGoals = float(candidateGoals / counterProblems)
		counterProblems = float(counterProblems)
		counterTruePositivePoblems = float(counterTruePositivePoblems)
		trueNegativeCounter = float((counterProblems*(candidateGoals / counterProblems)) - counterFalsePositivePoblems)
		trueNegativeCounter = float(trueNegativeCounter)
		falseNegativeCounter = float(counterProblems - counterTruePositivePoblems)
		accuracy = float(counterTruePositivePoblems / counterProblems)
		precision = float(counterTruePositivePoblems / (counterTruePositivePoblems + counterFalsePositivePoblems))
		recall = float(counterTruePositivePoblems / (counterTruePositivePoblems + falseNegativeCounter))
		f1score = 2 * ( (precision*recall) / (precision+recall) )
		fallout = counterFalsePositivePoblems / (trueNegativeCounter + counterFalsePositivePoblems)
		missrate = float(falseNegativeCounter / (falseNegativeCounter + counterTruePositivePoblems))
		totalT = (time.time() - startTime)
		totalTime = float(totalT / counterProblems)
		avgRecognizedGoals = float((counterFalsePositivePoblems+counterTruePositivePoblems)/counterProblems)

		obsPrint = obs
		if obs == 'full':
			obsPrint = '100'

		result = obsPrint + '\t' + str(accuracy) + '\t' + str(precision) + '\t' + str(recall) + '\t' + str(f1score) + '\t' + str(fallout) + '\t' + str(missrate) + '\t' + str(avgRecognizedGoals) + '\t' + str(totalTime) + '\n';
		experimentsResult = experimentsResult + result
		totalProblems = totalProblems + counterProblems

	print experimentsResult
	print '$> Total Problems: ' + str(totalProblems)
	fileResult = open('campus-planrecognition-ramirezgeffner.txt', 'w')
	fileResult.write(experimentsResult)

def easyIPCGrid(observability, useFilteringMethod, threshold):
	totalProblems = 0
	counterProblems = 0
	counterTruePositivePoblems = 0
	counterFalsePositivePoblems = 0
	startTime = time.time()
	candidateGoals = 0
	experimentsResult = ''
	for obs in observability :
		startTime = time.time()
		counterProblems = 0
		counterTruePositivePoblems = 0
		counterFalsePositivePoblems = 0
		candidateGoals = 0

		for problem in range(0, 1) :
			for problemHyp in range(0, 5) :
				for problemObs in range(0, 1) :
					cmdClean = 'rm -rf *.pddl *.dat *.log *.soln *.csv report.txt results.tar.bz2'
					os.system(cmdClean)

					if useFilteringMethod:
						if obs == 'full':
							planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid-aaai_p5-5-5' + '_hyp-' + str(problemHyp) + '_full.tar.bz2'
						else: planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid-aaai_p5-5-5' + '_hyp-' + str(problemHyp) + '_' + str(obs) + '_' + str(problemObs) + '.tar.bz2'
						
						print '-> FILTERING CANDIDATE GOALS'
						cmdJar = 'java -jar planrecognizer-filter1.43.jar ' + planRecognitionProblem  + ' ' + threshold
						print cmdJar
						os.system(cmdJar)					

					if obs == 'full':
						planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid-aaai_p5-5-5' + '_hyp-' + str(problemHyp) + ('_full_FILTERED.tar.bz2' if useFilteringMethod else '_full.tar.bz2')
					else: planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid-aaai_p5-5-5' + '_hyp-' + str(problemHyp) + '_' + str(obs) + '_' + str(problemObs) + ('_FILTERED.tar.bz2' if useFilteringMethod else '.tar.bz2')

					print planRecognitionProblem
					counterProblems = counterProblems + 1
					args = ['-s', '-e', planRecognitionProblem]
					options = Program_Options( args )

					hyps = load_hypotheses()
					candidateGoals = candidateGoals + len(hyps)
					
					for i in range( 0, len(hyps) ) :
						hyps[i].test(i, options.simple_pr, options.bfs)

					hyp = None
					for h in hyps:
						if not h.test_failed:
							if not hyp or h.score > hyp.score:
								hyp = h

					realHyp = None
					for h in hyps:
						if h.is_true:
							realHyp = h
							break

					for h in hyps:
						if h.test_failed or (h.score == hyp.score and h != realHyp):
							counterFalsePositivePoblems = counterFalsePositivePoblems + 1

					if hyp and realHyp and hyp.score == realHyp.score :
						counterTruePositivePoblems = counterTruePositivePoblems + 1

					if obs == 'full':
						break

		for problem in range(0, 1) :
			for problemHyp in range(0, 5) :
				for problemObs in range(0, 1) :
					cmdClean = 'rm -rf *.pddl *.dat *.log *.soln *.csv report.txt results.tar.bz2'
					os.system(cmdClean)

					if useFilteringMethod:
						if obs == 'full':
							planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid-aaai_p10-5-5' + '_hyp-' + str(problemHyp) + '_full.tar.bz2'
						else: planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid-aaai_p10-5-5' + '_hyp-' + str(problemHyp) + '_' + str(obs) + '_' + str(problemObs) + '.tar.bz2'
						
						print '-> FILTERING CANDIDATE GOALS'
						cmdJar = 'java -jar planrecognizer-filter1.43.jar ' + planRecognitionProblem  + ' ' + threshold
						print cmdJar
						os.system(cmdJar)					

					if obs == 'full':
						planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid-aaai_p10-5-5' + '_hyp-' + str(problemHyp) + ('_full_FILTERED.tar.bz2' if useFilteringMethod else '_full.tar.bz2')
					else: planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid-aaai_p10-5-5' + '_hyp-' + str(problemHyp) + '_' + str(obs) + '_' + str(problemObs) + ('_FILTERED.tar.bz2' if useFilteringMethod else '.tar.bz2')

					print planRecognitionProblem
					counterProblems = counterProblems + 1
					args = ['-s', '-e', planRecognitionProblem]
					options = Program_Options( args )

					hyps = load_hypotheses()
					candidateGoals = candidateGoals + len(hyps)
					
					for i in range( 0, len(hyps) ) :
						hyps[i].test(i, options.simple_pr, options.bfs)

					hyp = None
					for h in hyps:
						if not h.test_failed:
							if not hyp or h.score > hyp.score:
								hyp = h

					realHyp = None
					for h in hyps:
						if h.is_true:
							realHyp = h
							break

					for h in hyps:
						if h.test_failed or (h.score == hyp.score and h != realHyp):
							counterFalsePositivePoblems = counterFalsePositivePoblems + 1

					if hyp and realHyp and hyp.score == realHyp.score :
						counterTruePositivePoblems = counterTruePositivePoblems + 1

					if obs == 'full':
						break

		for problem in range(0, 1) :
			for problemHyp in range(0, 5) :
				for problemObs in range(0, 1) :
					cmdClean = 'rm -rf *.pddl *.dat *.log *.soln *.csv report.txt results.tar.bz2'
					os.system(cmdClean)

					if useFilteringMethod:
						if obs == 'full':
							planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid-aaai_p5-10-10' + '_hyp-' + str(problemHyp) + '_full.tar.bz2'
						else: planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid-aaai_p5-10-10' + '_hyp-' + str(problemHyp) + '_' + str(obs) + '_' + str(problemObs) + '.tar.bz2'
						
						print '-> FILTERING CANDIDATE GOALS'
						cmdJar = 'java -jar planrecognizer-filter1.43.jar ' + planRecognitionProblem  + ' ' + threshold
						print cmdJar
						os.system(cmdJar)					

					if obs == 'full':
						planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid-aaai_p5-10-10' + '_hyp-' + str(problemHyp) + ('_full_FILTERED.tar.bz2' if useFilteringMethod else '_full.tar.bz2')
					else: planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid-aaai_p5-10-10' + '_hyp-' + str(problemHyp) + '_' + str(obs) + '_' + str(problemObs) + ('_FILTERED.tar.bz2' if useFilteringMethod else '.tar.bz2')

					print planRecognitionProblem
					counterProblems = counterProblems + 1
					args = ['-s', '-e', planRecognitionProblem]
					options = Program_Options( args )

					hyps = load_hypotheses()
					candidateGoals = candidateGoals + len(hyps)
					
					for i in range( 0, len(hyps) ) :
						hyps[i].test(i, options.simple_pr, options.bfs)

					hyp = None
					for h in hyps:
						if not h.test_failed:
							if not hyp or h.score > hyp.score:
								hyp = h

					realHyp = None
					for h in hyps:
						if h.is_true:
							realHyp = h
							break

					for h in hyps:
						if h.test_failed or (h.score == hyp.score and h != realHyp):
							counterFalsePositivePoblems = counterFalsePositivePoblems + 1

					if hyp and realHyp and hyp.score == realHyp.score :
						counterTruePositivePoblems = counterTruePositivePoblems + 1

					if obs == 'full':
						break

		for problem in range(1, 2) :
			for problemHyp in range(0, 5) :
				for problemObs in range(0, 3) :
					cmdClean = 'rm -rf *.pddl *.dat *.log *.soln *.csv report.txt results.tar.bz2'
					os.system(cmdClean)

					if useFilteringMethod:
						if obs == 'full':
							planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid_p5-5-5' + '_hyp-' + str(problemHyp) + '_full.tar.bz2'
						else: planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid_p5-5-5' + '_hyp-' + str(problemHyp) + '_' + str(obs) + '_' + str(problemObs) + '.tar.bz2'
						
						print '-> FILTERING CANDIDATE GOALS'
						cmdJar = 'java -jar planrecognizer-filter1.43.jar ' + planRecognitionProblem  + ' ' + threshold
						print cmdJar
						os.system(cmdJar)					

					if obs == 'full':
						planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid_p5-5-5' + '_hyp-' + str(problemHyp) + ('_full_FILTERED.tar.bz2' if useFilteringMethod else '_full.tar.bz2')
					else: planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid_p5-5-5' + '_hyp-' + str(problemHyp) + '_' + str(obs) + '_' + str(problemObs) + ('_FILTERED.tar.bz2' if useFilteringMethod else '.tar.bz2')

					print planRecognitionProblem
					counterProblems = counterProblems + 1
					args = ['-s', '-e', planRecognitionProblem]
					options = Program_Options( args )

					hyps = load_hypotheses()
					candidateGoals = candidateGoals + len(hyps)
					
					for i in range( 0, len(hyps) ) :
						hyps[i].test(i, options.simple_pr, options.bfs)

					hyp = None
					for h in hyps:
						if not h.test_failed:
							if not hyp or h.score > hyp.score:
								hyp = h

					realHyp = None
					for h in hyps:
						if h.is_true:
							realHyp = h
							break

					for h in hyps:
						if h.test_failed or (h.score == hyp.score and h != realHyp):
							counterFalsePositivePoblems = counterFalsePositivePoblems + 1

					if hyp and realHyp and hyp.score == realHyp.score :
						counterTruePositivePoblems = counterTruePositivePoblems + 1

					if obs == 'full':
						break				

		for problem in range(1, 2) :
			for problemHyp in range(0, 10) :
				for problemObs in range(0, 3) :
					cmdClean = 'rm -rf *.pddl *.dat *.log *.soln *.csv report.txt results.tar.bz2'
					os.system(cmdClean)

					if useFilteringMethod:
						if obs == 'full':
							planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid_p5-10-10' + '_hyp-' + str(problemHyp) + '_full.tar.bz2'
						else: planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid_p5-10-10' + '_hyp-' + str(problemHyp) + '_' + str(obs) + '_' + str(problemObs) + '.tar.bz2'
						
						print '-> FILTERING CANDIDATE GOALS'
						cmdJar = 'java -jar planrecognizer-filter1.43.jar ' + planRecognitionProblem  + ' ' + threshold
						print cmdJar
						os.system(cmdJar)					

					if obs == 'full':
						planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid_p5-10-10' + '_hyp-' + str(problemHyp) + ('_full_FILTERED.tar.bz2' if useFilteringMethod else '_full.tar.bz2')
					else: planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid_p5-10-10' + '_hyp-' + str(problemHyp) + '_' + str(obs) + '_' + str(problemObs) + ('_FILTERED.tar.bz2' if useFilteringMethod else '.tar.bz2')
					
					print planRecognitionProblem
					counterProblems = counterProblems + 1
					args = ['-s', '-e', planRecognitionProblem]
					options = Program_Options( args )

					hyps = load_hypotheses()
					candidateGoals = candidateGoals + len(hyps)
					
					for i in range( 0, len(hyps) ) :
						hyps[i].test(i, options.simple_pr, options.bfs)

					hyp = None
					for h in hyps:
						if not h.test_failed:
							if not hyp or h.score > hyp.score:
								hyp = h

					realHyp = None
					for h in hyps:
						if h.is_true:
							realHyp = h
							break

					for h in hyps:
						if h.test_failed or (h.score == hyp.score and h != realHyp):
							counterFalsePositivePoblems = counterFalsePositivePoblems + 1

					if hyp and realHyp and hyp.score == realHyp.score :
						counterTruePositivePoblems = counterTruePositivePoblems + 1

					if obs == 'full':
						break

		for problem in range(1, 2) :
			for problemHyp in range(0, 5) :
				for problemObs in range(0, 3) :
					cmdClean = 'rm -rf *.pddl *.dat *.log *.soln *.csv report.txt results.tar.bz2'
					os.system(cmdClean)

					if useFilteringMethod:
						if obs == 'full':
							planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid_p10-5-5' + '_hyp-' + str(problemHyp) + '_full.tar.bz2'
						else: planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid_p10-5-5' + '_hyp-' + str(problemHyp) + '_' + str(obs) + '_' + str(problemObs) + '.tar.bz2'
						
						print '-> FILTERING CANDIDATE GOALS'
						cmdJar = 'java -jar planrecognizer-filter1.43.jar ' + planRecognitionProblem  + ' ' + threshold
						print cmdJar
						os.system(cmdJar)					

					if obs == 'full':
						planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid_p10-5-5' + '_hyp-' + str(problemHyp) + ('_full_FILTERED.tar.bz2' if useFilteringMethod else '_full.tar.bz2')
					else: planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid_p10-5-5' + '_hyp-' + str(problemHyp) + '_' + str(obs) + '_' + str(problemObs) + ('_FILTERED.tar.bz2' if useFilteringMethod else '.tar.bz2')

					print planRecognitionProblem
					counterProblems = counterProblems + 1
					args = ['-s', '-e', planRecognitionProblem]
					options = Program_Options( args )

					hyps = load_hypotheses()
					candidateGoals = candidateGoals + len(hyps)
					
					for i in range( 0, len(hyps) ) :
						hyps[i].test(i, options.simple_pr, options.bfs)

					hyp = None
					for h in hyps:
						if not h.test_failed:
							if not hyp or h.score > hyp.score:
								hyp = h

					realHyp = None
					for h in hyps:
						if h.is_true:
							realHyp = h
							break

					for h in hyps:
						if h.test_failed or (h.score == hyp.score and h != realHyp):
							counterFalsePositivePoblems = counterFalsePositivePoblems + 1

					if hyp and realHyp and hyp.score == realHyp.score :
						counterTruePositivePoblems = counterTruePositivePoblems + 1

					if obs == 'full':
						break

		for problem in range(1, 2) :
			for problemHyp in range(0, 10) :
				for problemObs in range(0, 3) :
					cmdClean = 'rm -rf *.pddl *.dat *.log *.soln *.csv report.txt results.tar.bz2'
					os.system(cmdClean)

					if useFilteringMethod:
						if obs == 'full':
							planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid_p10-10-10' + '_hyp-' + str(problemHyp) + '_full.tar.bz2'
						else: planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid_p10-10-10' + '_hyp-' + str(problemHyp) + '_' + str(obs) + '_' + str(problemObs) + '.tar.bz2'
						
						print '-> FILTERING CANDIDATE GOALS'
						cmdJar = 'java -jar planrecognizer-filter1.43.jar ' + planRecognitionProblem  + ' ' + threshold
						print cmdJar
						os.system(cmdJar)					

					if obs == 'full':
						planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid_p10-10-10' + '_hyp-' + str(problemHyp) + ('_full_FILTERED.tar.bz2' if useFilteringMethod else '_full.tar.bz2')
					else: planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid_p10-10-10' + '_hyp-' + str(problemHyp) + '_' + str(obs) + '_' + str(problemObs) + ('_FILTERED.tar.bz2' if useFilteringMethod else '.tar.bz2')

					print planRecognitionProblem
					counterProblems = counterProblems + 1
					args = ['-s', '-e', planRecognitionProblem]
					options = Program_Options( args )

					hyps = load_hypotheses()
					candidateGoals = candidateGoals + len(hyps)
					
					for i in range( 0, len(hyps) ) :
						hyps[i].test(i, options.simple_pr, options.bfs)

					hyp = None
					for h in hyps:
						if not h.test_failed:
							if not hyp or h.score > hyp.score:
								hyp = h

					realHyp = None
					for h in hyps:
						if h.is_true:
							realHyp = h
							break

					for h in hyps:
						if h.test_failed or (h.score == hyp.score and h != realHyp):
							counterFalsePositivePoblems = counterFalsePositivePoblems + 1

					if hyp and realHyp and hyp.score == realHyp.score :
						counterTruePositivePoblems = counterTruePositivePoblems + 1

					if obs == 'full':
						break

		for problem in range(4, 8) :
			for problemHyp in range(1, 5) :
				for problemObs in range(1, 4) :
					cmdClean = 'rm -rf *.pddl *.dat *.log *.soln *.csv report.txt results.tar.bz2'
					os.system(cmdClean)

					if useFilteringMethod:
						if obs == 'full':
							planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid_p0' + str(problem) + '_hyp-' + str(problemHyp) + '_full.tar.bz2'
						else: planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid_p0' + str(problem) + '_hyp-' + str(problemHyp) + '_' + str(obs) + '_' + str(problemObs) + '.tar.bz2'
						
						print '-> FILTERING CANDIDATE GOALS'
						cmdJar = 'java -jar planrecognizer-filter1.43.jar ' + planRecognitionProblem  + ' ' + threshold
						print cmdJar
						os.system(cmdJar)

					if obs == 'full':
						planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid_p0' + str(problem) + '_hyp-' + str(problemHyp) + ('_full_FILTERED.tar.bz2' if useFilteringMethod else '_full.tar.bz2')
					else: planRecognitionProblem = 'experiments/easy-ipc-grid/easy-ipc-grid_p0' + str(problem) + '_hyp-' + str(problemHyp) + '_' + str(obs) + '_' + str(problemObs) + ('_FILTERED.tar.bz2' if useFilteringMethod else '.tar.bz2')
					
					print planRecognitionProblem
					counterProblems = counterProblems + 1
					args = ['-s', '-e', planRecognitionProblem]
					options = Program_Options( args )

					hyps = load_hypotheses()
					candidateGoals = candidateGoals + len(hyps)
					
					for i in range( 0, len(hyps) ) :
						hyps[i].test(i, options.simple_pr, options.bfs)

					hyp = None
					for h in hyps:
						if not h.test_failed:
							if not hyp or h.score > hyp.score:
								hyp = h

					realHyp = None
					for h in hyps:
						if h.is_true:
							realHyp = h
							break

					for h in hyps:
						if h.test_failed or (h.score == hyp.score and h != realHyp):
							counterFalsePositivePoblems = counterFalsePositivePoblems + 1

					if hyp and realHyp and hyp.score == realHyp.score :
						counterTruePositivePoblems = counterTruePositivePoblems + 1

					if obs == 'full':
						break

		totalCandidateGoals = float(candidateGoals / counterProblems)
		counterProblems = float(counterProblems)
		counterTruePositivePoblems = float(counterTruePositivePoblems)
		trueNegativeCounter = float((counterProblems*(candidateGoals / counterProblems)) - counterFalsePositivePoblems)
		trueNegativeCounter = float(trueNegativeCounter)
		falseNegativeCounter = float(counterProblems - counterTruePositivePoblems)
		accuracy = float(counterTruePositivePoblems / counterProblems)
		precision = float(counterTruePositivePoblems / (counterTruePositivePoblems + counterFalsePositivePoblems))
		recall = float(counterTruePositivePoblems / (counterTruePositivePoblems + falseNegativeCounter))
		f1score = 2 * ( (precision*recall) / (precision+recall) )
		fallout = counterFalsePositivePoblems / (trueNegativeCounter + counterFalsePositivePoblems)
		missrate = float(falseNegativeCounter / (falseNegativeCounter + counterTruePositivePoblems))
		totalT = (time.time() - startTime)
		totalTime = float(totalT / counterProblems)
		avgRecognizedGoals = float((counterFalsePositivePoblems+counterTruePositivePoblems)/counterProblems)
		obsPrint = obs
		if obs == 'full':
			obsPrint = '100'

		result = obsPrint + '\t' + str(accuracy) + '\t' + str(precision) + '\t' + str(recall) + '\t' + str(f1score) + '\t' + str(fallout) + '\t' + str(missrate) + '\t' + str(avgRecognizedGoals) + '\t' + str(totalTime) + '\n';
		experimentsResult = experimentsResult + result
		totalProblems = totalProblems + counterProblems

	resultFileName = 'easyipcgrid-planrecognition-ramirezgeffner.txt'
	if useFilteringMethod:
		resultFileName = 'easyipcgrid-planrecognition-ramirezgeffner+filter-' + str(threshold) +'.txt'

	print experimentsResult
	print '$> Total Problems: ' + str(totalProblems)
	fileResult = open(resultFileName, 'w')
	fileResult.write(experimentsResult)

def intrusionDetection(observability, useFilteringMethod, threshold):
	totalProblems = 0
	counterProblems = 0
	counterTruePositivePoblems = 0
	counterFalsePositivePoblems = 0
	startTime = time.time()
	candidateGoals = 0
	experimentsResult = ''
	problemIntrusion = 0
	for obs in observability :
		startTime = time.time()
		counterProblems = 0
		counterTruePositivePoblems = 0
		counterFalsePositivePoblems = 0
		candidateGoals = 0
		problemIntrusion = 0
		for problem in range(0, 1) :
			problemIntrusion += 10
			for problemHyp in range(0, 10) :
				for problemObs in range(0, 3) :
					cmdClean = 'rm -rf *.pddl *.dat *.log *.soln *.csv report.txt results.tar.bz2'
					os.system(cmdClean)

					if useFilteringMethod:
						if obs == 'full':
							planRecognitionProblem = 'experiments/intrusion-detection/intrusion-detection_p' + str(problemIntrusion) + '_hyp-' + str(problemHyp) + '_full.tar.bz2'
						else: planRecognitionProblem = 'experiments/intrusion-detection/intrusion-detection_p' + str(problemIntrusion) + '_hyp-' + str(problemHyp) + '_' + str(obs) + '_' + str(problemObs) + '.tar.bz2'
						
						print '-> FILTERING CANDIDATE GOALS'
						cmdJar = 'java -jar planrecognizer-filter1.43.jar ' + planRecognitionProblem  + ' ' + threshold
						print cmdJar
						os.system(cmdJar)

					if obs == 'full':
						planRecognitionProblem = 'experiments/intrusion-detection/intrusion-detection_p' + str(problemIntrusion) + '_hyp-' + str(problemHyp) + ('_full_FILTERED.tar.bz2' if useFilteringMethod else '_full.tar.bz2')
					else: planRecognitionProblem = 'experiments/intrusion-detection/intrusion-detection_p' + str(problemIntrusion) + '_hyp-' + str(problemHyp) + '_' + str(obs) + '_' + str(problemObs) + ('_FILTERED.tar.bz2' if useFilteringMethod else '.tar.bz2')
					
					print planRecognitionProblem
					counterProblems = counterProblems + 1
					args = ['-s', '-e', planRecognitionProblem]
					options = Program_Options( args )

					hyps = load_hypotheses()
					candidateGoals = candidateGoals + len(hyps)
					
					for i in range( 0, len(hyps) ) :
						hyps[i].test(i, options.simple_pr, options.bfs)

					hyp = None
					for h in hyps:
						if not h.test_failed:
							if not hyp or h.score > hyp.score:
								hyp = h

					realHyp = None
					for h in hyps:
						if h.is_true:
							realHyp = h
							break

					for h in hyps:
						if h.test_failed or (h.score == hyp.score and h != realHyp):
							counterFalsePositivePoblems = counterFalsePositivePoblems + 1

					if hyp and realHyp and hyp.score == realHyp.score :
						counterTruePositivePoblems = counterTruePositivePoblems + 1

					if obs == 'full':
						break

		problemIntrusion = 0
		for problem in range(0, 1) :
			problemIntrusion += 20
			for problemHyp in range(0, 20) :
				for problemObs in range(0, 3) :
					cmdClean = 'rm -rf *.pddl *.dat *.log *.soln *.csv report.txt results.tar.bz2'
					os.system(cmdClean)
					
					if useFilteringMethod:
						if obs == 'full':
							planRecognitionProblem = 'experiments/intrusion-detection/intrusion-detection_p' + str(problemIntrusion) + '_hyp-' + str(problemHyp) + '_full.tar.bz2'
						else: planRecognitionProblem = 'experiments/intrusion-detection/intrusion-detection_p' + str(problemIntrusion) + '_hyp-' + str(problemHyp) + '_' + str(obs) + '_' + str(problemObs) + '.tar.bz2'
						
						print '-> FILTERING CANDIDATE GOALS'
						cmdJar = 'java -jar planrecognizer-filter1.43.jar ' + planRecognitionProblem  + ' ' + threshold
						print cmdJar
						os.system(cmdJar)

					if obs == 'full':
						planRecognitionProblem = 'experiments/intrusion-detection/intrusion-detection_p' + str(problemIntrusion) + '_hyp-' + str(problemHyp) + ('_full_FILTERED.tar.bz2' if useFilteringMethod else '_full.tar.bz2')
					else: planRecognitionProblem = 'experiments/intrusion-detection/intrusion-detection_p' + str(problemIntrusion) + '_hyp-' + str(problemHyp) + '_' + str(obs) + '_' + str(problemObs) + ('_FILTERED.tar.bz2' if useFilteringMethod else '.tar.bz2')
					
					print planRecognitionProblem
					counterProblems = counterProblems + 1
					args = ['-s', '-e', planRecognitionProblem]
					options = Program_Options( args )

					hyps = load_hypotheses()
					candidateGoals = candidateGoals + len(hyps)
					
					for i in range( 0, len(hyps) ) :
						hyps[i].test(i, options.simple_pr, options.bfs)

					hyp = None
					for h in hyps:
						if not h.test_failed:
							if not hyp or h.score > hyp.score:
								hyp = h

					realHyp = None
					for h in hyps:
						if h.is_true:
							realHyp = h
							break

					for h in hyps:
						if h.test_failed or (h.score == hyp.score and h != realHyp):
							counterFalsePositivePoblems = counterFalsePositivePoblems + 1

					if hyp and realHyp and hyp.score == realHyp.score :
						counterTruePositivePoblems = counterTruePositivePoblems + 1

					if obs == 'full':
						break
		
		totalCandidateGoals = float(candidateGoals / counterProblems)
		counterProblems = float(counterProblems)
		counterTruePositivePoblems = float(counterTruePositivePoblems)
		trueNegativeCounter = float((counterProblems*(candidateGoals / counterProblems)) - counterFalsePositivePoblems)
		trueNegativeCounter = float(trueNegativeCounter)
		falseNegativeCounter = float(counterProblems - counterTruePositivePoblems)
		accuracy = float(counterTruePositivePoblems / counterProblems)
		precision = float(counterTruePositivePoblems / (counterTruePositivePoblems + counterFalsePositivePoblems))
		recall = float(counterTruePositivePoblems / (counterTruePositivePoblems + falseNegativeCounter))
		f1score = 2 * ( (precision*recall) / (precision+recall) )
		fallout = counterFalsePositivePoblems / (trueNegativeCounter + counterFalsePositivePoblems)
		missrate = float(falseNegativeCounter / (falseNegativeCounter + counterTruePositivePoblems))
		totalT = (time.time() - startTime)
		totalTime = float(totalT / counterProblems)
		avgRecognizedGoals = float((counterFalsePositivePoblems+counterTruePositivePoblems)/counterProblems)
		obsPrint = obs
		if obs == 'full':
			obsPrint = '100'

		result = obsPrint + '\t' + str(accuracy) + '\t' + str(precision) + '\t' + str(recall) + '\t' + str(f1score) + '\t' + str(fallout) + '\t' + str(missrate) + '\t' + str(avgRecognizedGoals) + '\t' + str(totalTime) + '\n';
		experimentsResult = experimentsResult + result
		totalProblems = totalProblems + counterProblems

	resultFileName = 'intrusiondetection-planrecognition-ramirezgeffner.txt'
	if useFilteringMethod:
		resultFileName = 'intrusiondetection-planrecognition-ramirezgeffner+filter-' + str(threshold) +'.txt'

	print experimentsResult
	print '$> Total Problems: ' + str(totalProblems)
	fileResult = open(resultFileName, 'w')
	fileResult.write(experimentsResult)

def kitchen(observability, useFilteringMethod, threshold):
	totalProblems = 0
	counterProblems = 0
	counterTruePositivePoblems = 0
	counterFalsePositivePoblems = 0
	startTime = time.time()
	candidateGoals = 0
	experimentsResult = ''
	for obs in observability :
		startTime = time.time()
		counterProblems = 0
		counterTruePositivePoblems = 0
		counterFalsePositivePoblems = 0
		candidateGoals = 0
		for problem in range(0, 15) :
			cmdClean = 'rm -rf *.pddl *.dat *.log *.soln *.csv report.txt results.tar.bz2'
			os.system(cmdClean)

			if useFilteringMethod:
				if obs == 'full':
					planRecognitionProblem = 'experiments/kitchen/kitchen_generic_hyp-0' + '_full_' + str(problem) + '.tar.bz2'
				else : planRecognitionProblem = 'experiments/kitchen/kitchen_generic_hyp-0' + '_' + str(obs) + '_' + str(problem) + '.tar.bz2'
				
				print '-> FILTERING CANDIDATE GOALS'
				cmdJar = 'java -jar planrecognizer-filter1.43.jar ' + planRecognitionProblem  + ' ' + threshold
				print cmdJar
				os.system(cmdJar)

			if obs == 'full':
				planRecognitionProblem = 'experiments/kitchen/kitchen_generic_hyp-0' + ('_full_' + str(problem) + '_FILTERED.tar.bz2' if useFilteringMethod else '_full_' + str(problem) + '.tar.bz2')
			else : planRecognitionProblem = 'experiments/kitchen/kitchen_generic_hyp-0' + '_' + str(obs) + '_' + str(problem) + '.tar.bz2'
			
			print planRecognitionProblem
			counterProblems = counterProblems + 1
			args = ['-s', '-e', planRecognitionProblem]
			options = Program_Options( args )

			hyps = load_hypotheses()
			candidateGoals = candidateGoals + len(hyps)
			
			for i in range( 0, len(hyps) ) :
				hyps[i].test(i, options.simple_pr, options.bfs)

			hyp = None
			for h in hyps:
				if not h.test_failed:
					if not hyp or h.score > hyp.score:
						hyp = h

			realHyp = None
			for h in hyps:
				if h.is_true:
					realHyp = h
					break

			for h in hyps:
				if h.test_failed or (h.score == hyp.score and h != realHyp):
					counterFalsePositivePoblems = counterFalsePositivePoblems + 1

			if hyp and realHyp and hyp.score == realHyp.score :
				counterTruePositivePoblems = counterTruePositivePoblems + 1

		totalCandidateGoals = float(candidateGoals / counterProblems)
		counterProblems = float(counterProblems)
		counterTruePositivePoblems = float(counterTruePositivePoblems)
		trueNegativeCounter = float((counterProblems*(candidateGoals / counterProblems)) - counterFalsePositivePoblems)
		trueNegativeCounter = float(trueNegativeCounter)
		falseNegativeCounter = float(counterProblems - counterTruePositivePoblems)
		accuracy = float(counterTruePositivePoblems / counterProblems)
		precision = float(counterTruePositivePoblems / (counterTruePositivePoblems + counterFalsePositivePoblems))
		recall = float(counterTruePositivePoblems / (counterTruePositivePoblems + falseNegativeCounter))
		f1score = 2 * ( (precision*recall) / (precision+recall) )
		fallout = counterFalsePositivePoblems / (trueNegativeCounter + counterFalsePositivePoblems)
		missrate = float(falseNegativeCounter / (falseNegativeCounter + counterTruePositivePoblems))
		totalT = (time.time() - startTime)
		totalTime = float(totalT / counterProblems)
		avgRecognizedGoals = float((counterFalsePositivePoblems+counterTruePositivePoblems)/counterProblems)
		obsPrint = obs
		if obs == 'full':
			obsPrint = '100'

		print counterFalsePositivePoblems
		print counterTruePositivePoblems
		print counterProblems

		result = obsPrint + '\t' + str(accuracy) + '\t' + str(precision) + '\t' + str(recall) + '\t' + str(f1score) + '\t' + str(fallout) + '\t' + str(missrate) + '\t' + str(avgRecognizedGoals) + '\t' + str(totalTime) + '\n';
		experimentsResult = experimentsResult + result
		totalProblems = totalProblems + counterProblems

	print experimentsResult
	print '$> Total Problems: ' + str(totalProblems)
	fileResult = open('kitchen-planrecognition-ramirezgeffner.txt', 'w')
	fileResult.write(experimentsResult)

def logistics(observability, useFilteringMethod, threshold):
	totalProblems = 0
	counterProblems = 0
	counterTruePositivePoblems = 0
	counterFalsePositivePoblems = 0
	startTime = time.time()
	candidateGoals = 0
	experimentsResult = ''
	for obs in observability :
		startTime = time.time()
		counterProblems = 0
		counterTruePositivePoblems = 0
		counterFalsePositivePoblems = 0
		candidateGoals = 0
		for problem in range(1, 4) :
			for problemHyp in range(0, 5) :
				for problemObs in range(0, 1) :
					cmdClean = 'rm -rf *.pddl *.dat *.log *.soln *.csv report.txt results.tar.bz2'
					os.system(cmdClean)

					if useFilteringMethod:
						if obs == 'full':
							planRecognitionProblem = 'experiments/logistics/logistics_p0' + str(problem) + '_hyp-' + str(problemHyp) + '_full.tar.bz2'
						else: planRecognitionProblem = 'experiments/logistics/logistics_p0' + str(problem) + '_hyp-' + str(problemHyp) + '_' + str(obs) + '_' + str(problemObs) + '.tar.bz2'
						
						print '-> FILTERING CANDIDATE GOALS'
						cmdJar = 'java -jar planrecognizer-filter1.43.jar ' + planRecognitionProblem  + ' ' + threshold
						print cmdJar
						os.system(cmdJar)

					if obs == 'full':
						planRecognitionProblem = 'experiments/logistics/logistics_p0' + str(problem) + '_hyp-' + str(problemHyp) + ('_full_FILTERED.tar.bz2' if useFilteringMethod else '_full.tar.bz2')
					else: planRecognitionProblem = 'experiments/logistics/logistics_p0' + str(problem) + '_hyp-' + str(problemHyp) + '_' + str(obs) + '_' + str(problemObs) + ('_FILTERED.tar.bz2' if useFilteringMethod else '.tar.bz2')
					
					print planRecognitionProblem
					counterProblems = counterProblems + 1
					args = ['-s', '-e', planRecognitionProblem]
					options = Program_Options( args )

					hyps = load_hypotheses()
					candidateGoals = candidateGoals + len(hyps)
					
					for i in range( 0, len(hyps) ) :
						hyps[i].test(i, options.simple_pr, options.bfs)

					hyp = None
					for h in hyps:
						if not h.test_failed:
							if not hyp or h.score > hyp.score:
								hyp = h

					realHyp = None
					for h in hyps:
						if h.is_true:
							realHyp = h
							break

					for h in hyps:
						if h.test_failed or (h.score == hyp.score and h != realHyp):
							counterFalsePositivePoblems = counterFalsePositivePoblems + 1

					if hyp and realHyp and hyp.score == realHyp.score :
						counterTruePositivePoblems = counterTruePositivePoblems + 1

					if obs == 'full':
						break

		for problem in range(1, 4) :
			for problemHyp in range(0, 10) :
				for problemObs in range(0, 3) :
					cmdClean = 'rm -rf *.pddl *.dat *.log *.soln *.csv report.txt results.tar.bz2'
					os.system(cmdClean)

					if useFilteringMethod:
						if obs == 'full':
							planRecognitionProblem = 'experiments/logistics/logistics_p0' + str(problem) + '_hyp-' + str(problemHyp) + '_full.tar.bz2'
						else: planRecognitionProblem = 'experiments/logistics/logistics_p0' + str(problem) + '_hyp-' + str(problemHyp) + '_' + str(obs) + '_' + str(problemObs) + '.tar.bz2'
						
						print '-> FILTERING CANDIDATE GOALS'
						cmdJar = 'java -jar planrecognizer-filter1.43.jar ' + planRecognitionProblem  + ' ' + threshold
						print cmdJar
						os.system(cmdJar)

					if obs == 'full':
						planRecognitionProblem = 'experiments/logistics/logistics_p0' + str(problem) + '_hyp-' + str(problemHyp) + ('_full_FILTERED.tar.bz2' if useFilteringMethod else '_full.tar.bz2')
					else: planRecognitionProblem = 'experiments/logistics/logistics_p0' + str(problem) + '_hyp-' + str(problemHyp) + '_' + str(obs) + '_' + str(problemObs) + ('_FILTERED.tar.bz2' if useFilteringMethod else '.tar.bz2')
					
					print planRecognitionProblem
					counterProblems = counterProblems + 1
					args = ['-s', '-e', planRecognitionProblem]
					options = Program_Options( args )

					hyps = load_hypotheses()
					candidateGoals = candidateGoals + len(hyps)
					
					for i in range( 0, len(hyps) ) :
						hyps[i].test(i, options.simple_pr, options.bfs)

					hyp = None
					for h in hyps:
						if not h.test_failed:
							if not hyp or h.score > hyp.score:
								hyp = h

					realHyp = None
					for h in hyps:
						if h.is_true:
							realHyp = h
							break

					for h in hyps:
						if h.test_failed or (h.score == hyp.score and h != realHyp):
							counterFalsePositivePoblems = counterFalsePositivePoblems + 1

					if hyp and realHyp and hyp.score == realHyp.score :
						counterTruePositivePoblems = counterTruePositivePoblems + 1

					if obs == 'full':
						break

		for problem in range(4, 8) :
			for problemHyp in range(1, 5) :
				for problemObs in range(1, 4) :
					cmdClean = 'rm -rf *.pddl *.dat *.log *.soln *.csv report.txt results.tar.bz2'
					os.system(cmdClean)

					if useFilteringMethod:
						if obs == 'full':
							planRecognitionProblem = 'experiments/logistics/logistics_p0' + str(problem) + '_hyp-' + str(problemHyp) + '_full.tar.bz2'
						else: planRecognitionProblem = 'experiments/logistics/logistics_p0' + str(problem) + '_hyp-' + str(problemHyp) + '_' + str(obs) + '_' + str(problemObs) + '.tar.bz2'
						
						print '-> FILTERING CANDIDATE GOALS'
						cmdJar = 'java -jar planrecognizer-filter1.43.jar ' + planRecognitionProblem  + ' ' + threshold
						print cmdJar
						os.system(cmdJar)

					if obs == 'full':
						planRecognitionProblem = 'experiments/logistics/logistics_p0' + str(problem) + '_hyp-' + str(problemHyp) + ('_full_FILTERED.tar.bz2' if useFilteringMethod else '_full.tar.bz2')
					else: planRecognitionProblem = 'experiments/logistics/logistics_p0' + str(problem) + '_hyp-' + str(problemHyp) + '_' + str(obs) + '_' + str(problemObs) + ('_FILTERED.tar.bz2' if useFilteringMethod else '.tar.bz2')
					
					print planRecognitionProblem
					counterProblems = counterProblems + 1
					args = ['-s', '-e', planRecognitionProblem]
					options = Program_Options( args )

					hyps = load_hypotheses()
					candidateGoals = candidateGoals + len(hyps)
					
					for i in range( 0, len(hyps) ) :
						hyps[i].test(i, options.simple_pr, options.bfs)

					hyp = None
					for h in hyps:
						if not h.test_failed:
							if not hyp or h.score > hyp.score:
								hyp = h

					realHyp = None
					for h in hyps:
						if h.is_true:
							realHyp = h
							break

					for h in hyps:
						if h.test_failed or (h.score == hyp.score and h != realHyp):
							counterFalsePositivePoblems = counterFalsePositivePoblems + 1

					if hyp and realHyp and hyp.score == realHyp.score :
						counterTruePositivePoblems = counterTruePositivePoblems + 1

					if obs == 'full':
						break

		totalCandidateGoals = float(candidateGoals / counterProblems)
		counterProblems = float(counterProblems)
		counterTruePositivePoblems = float(counterTruePositivePoblems)
		trueNegativeCounter = float((counterProblems*(candidateGoals / counterProblems)) - counterFalsePositivePoblems)
		trueNegativeCounter = float(trueNegativeCounter)
		falseNegativeCounter = float(counterProblems - counterTruePositivePoblems)
		accuracy = float(counterTruePositivePoblems / counterProblems)
		precision = float(counterTruePositivePoblems / (counterTruePositivePoblems + counterFalsePositivePoblems))
		recall = float(counterTruePositivePoblems / (counterTruePositivePoblems + falseNegativeCounter))
		f1score = 2 * ( (precision*recall) / (precision+recall) )
		fallout = counterFalsePositivePoblems / (trueNegativeCounter + counterFalsePositivePoblems)
		missrate = float(falseNegativeCounter / (falseNegativeCounter + counterTruePositivePoblems))
		totalT = (time.time() - startTime)
		totalTime = float(totalT / counterProblems)
		avgRecognizedGoals = float((counterFalsePositivePoblems+counterTruePositivePoblems)/counterProblems)
		obsPrint = obs
		if obs == 'full':
			obsPrint = '100'

		result = obsPrint + '\t' + str(accuracy) + '\t' + str(precision) + '\t' + str(recall) + '\t' + str(f1score) + '\t' + str(fallout) + '\t' + str(missrate) + '\t' + str(avgRecognizedGoals) + '\t' + str(totalTime) + '\n';
		experimentsResult = experimentsResult + result
		totalProblems = totalProblems + counterProblems

	resultFileName = 'logistics-planrecognition-ramirezgeffner.txt'
	if useFilteringMethod:
		resultFileName = 'logistics-planrecognition-ramirezgeffner+filter-' + str(threshold) +'.txt'

	print experimentsResult
	print '$> Total Problems: ' + str(totalProblems)
	fileResult = open(resultFileName, 'w')
	fileResult.write(experimentsResult)

def doExperiments(domainName, observability, useFilteringMethod, threshold):	
	totalProblems = 0
	counterProblems = 0
	counterTruePositivePoblems = 0
	counterFalsePositivePoblems = 0
	candidateGoals = 0

	startTime = time.time()
	experimentsResult = ''
	for obs in observability :
		startTime = time.time()
		counterProblems = 0
		counterTruePositivePoblems = 0
		counterFalsePositivePoblems = 0
		candidateGoals = 0
		for problem in range(1, 8) :
			for problemHyp in range(1, 5) :
				for problemObs in range(1, 4) :
					cmdClean = 'rm -rf *.pddl *.dat *.log *.soln *.csv report.txt results.tar.bz2'
					os.system(cmdClean)

					if useFilteringMethod:
						if obs == 'full':
							planRecognitionProblem = 'experiments/' + domainName + '/' + domainName + '_p0' + str(problem) + '_hyp-' + str(problemHyp) + ('_full_FILTERED.tar.bz2' if useFilteringMethod else '_full.tar.bz2')
						else: planRecognitionProblem = 'experiments/' + domainName + '/' + domainName + '_p0' + str(problem) + '_hyp-' + str(problemHyp) + '_' + str(obs) + '_' + str(problemObs) + ('_FILTERED.tar.bz2' if useFilteringMethod else '.tar.bz2')
						
						print '-> FILTERING CANDIDATE GOALS'
						cmdJar = 'java -jar planrecognizer-filter1.43.jar ' + planRecognitionProblem  + ' ' + threshold
						print cmdJar
						os.system(cmdJar)

					if obs == 'full':
						planRecognitionProblem = 'experiments/' + domainName + '/' + domainName + '_p0' + str(problem) + '_hyp-' + str(problemHyp) + ('_full_FILTERED.tar.bz2' if useFilteringMethod else '_full.tar.bz2')
					else: planRecognitionProblem = 'experiments/' + domainName + '/' + domainName + '_p0' + str(problem) + '_hyp-' + str(problemHyp) + '_' + str(obs) + '_' + str(problemObs) + ('_FILTERED.tar.bz2' if useFilteringMethod else '.tar.bz2')
					
					print planRecognitionProblem
					counterProblems = counterProblems + 1
					args = ['-s', '-e', planRecognitionProblem]
					options = Program_Options( args )

					hyps = load_hypotheses()
					candidateGoals = candidateGoals + len(hyps)
					
					for i in range( 0, len(hyps) ) :
						hyps[i].test(i, options.simple_pr, options.bfs)

					hyp = None
					for h in hyps:
						if not h.test_failed:
							if not hyp or h.score > hyp.score:
								hyp = h

					realHyp = None
					for h in hyps:
						if h.is_true:
							realHyp = h
							break

					for h in hyps:
						if h.test_failed or (h.score == hyp.score and h != realHyp):
							counterFalsePositivePoblems = counterFalsePositivePoblems + 1

					if hyp and realHyp and hyp.score == realHyp.score :
						counterTruePositivePoblems = counterTruePositivePoblems + 1

					if obs == 'full':
						break

		totalCandidateGoals = float(candidateGoals / counterProblems)
		counterProblems = float(counterProblems)
		counterTruePositivePoblems = float(counterTruePositivePoblems)
		trueNegativeCounter = float((counterProblems*(candidateGoals / counterProblems)) - counterFalsePositivePoblems)
		trueNegativeCounter = float(trueNegativeCounter)
		falseNegativeCounter = float(counterProblems - counterTruePositivePoblems)
		accuracy = float(counterTruePositivePoblems / counterProblems)
		precision = float(counterTruePositivePoblems / (counterTruePositivePoblems + counterFalsePositivePoblems))
		recall = float(counterTruePositivePoblems / (counterTruePositivePoblems + falseNegativeCounter))
		f1score = 2 * ( (precision*recall) / (precision+recall) )
		fallout = counterFalsePositivePoblems / (trueNegativeCounter + counterFalsePositivePoblems)
		missrate = float(falseNegativeCounter / (falseNegativeCounter + counterTruePositivePoblems))
		totalT = (time.time() - startTime)
		totalTime = float(totalT / counterProblems)
		avgRecognizedGoals = float((counterFalsePositivePoblems+counterTruePositivePoblems)/counterProblems)
		obsPrint = obs
		if obs == 'full':
			obsPrint = '100'

		result = obsPrint + '\t' + str(accuracy) + '\t' + str(precision) + '\t' + str(recall) + '\t' + str(f1score) + '\t' + str(fallout) + '\t' + str(missrate) + '\t' + str(avgRecognizedGoals) + '\t' + str(totalTime) + '\n';
		experimentsResult = experimentsResult + result
		totalProblems = totalProblems + counterProblems
	
	if useFilteringMethod :
		resultFileName = '-planrecognition-ramirezgeffner+filter-' + str(threshold) +'.txt'
		fileResult = open(str(domainName) + resultFileName, 'w')
	else : fileResult = open(str(domainName) + '-planrecognition-ramirezgeffner.txt', 'w')
	print experimentsResult
	print '$> Total Problems: ' + str(totalProblems)
	fileResult.write(experimentsResult)

def main():
	domainName = sys.argv[1]
	useFilteringMethod = False
	threshold = 0
	if(len(sys.argv) > 2):
		filteringMethod = sys.argv[2]
		threshold = sys.argv[3]
		if filteringMethod != None :
			useFilteringMethod = True

	observability = ['10', '30', '50', '70', 'full']

	if domainName == 'blocks-world':
		blocksWorld(observability, useFilteringMethod, threshold)
	elif domainName == 'campus':
		campus(observability, useFilteringMethod, threshold)
	elif domainName == 'grid':
		easyIPCGrid(observability, useFilteringMethod, threshold)
	elif domainName == 'intrusion-detection':
		intrusionDetection(observability, useFilteringMethod, threshold)
	elif domainName == 'kitchen':
		kitchen(observability, useFilteringMethod, threshold)
	elif domainName == 'logistics':
		logistics(observability, useFilteringMethod, threshold)
	else: doExperiments(domainName, observability, useFilteringMethod, threshold)

if __name__ == '__main__' :
	main()
