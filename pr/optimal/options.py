import getopt, os, sys

def usage() :
	print("Parameters:", file=sys.stderr)
	print("-e  --experiment <file>          Plan Recognition experiment files (tar'ed)", file=sys.stderr)
	print("-h  --help                       Get Help", file=sys.stderr)
	print("-t  --max-time <time>            Maximum allowed execution time (defaults to 1800 secs)", file=sys.stderr)
	print("-m  --max-memory <time>          Maximum allowed memory consumption (defaults to 1Gb)", file=sys.stderr)

class Program_Options :

	def __init__( self, args ) :
		try:
			opts, args = getopt.getopt(	args,
							"e:ht:m:",
							["experiment=",
							"help",
							"max-time=",
							"max-memory="] )
		except getopt.GetoptError :
			print("Missing or incorrect parameters specified!", file=sys.stderr)
			usage()
			sys.exit(1)

		self.exp_file = None
		self.domain_name = None
		self.instance_names = []
		self.goal_file = None
		self.max_time = 1800
		self.max_memory = 1024
		for opcode, oparg in opts :
			if opcode in ( '-h', '--help' ) :
				print("Help invoked!", file=sys.stderr)
				usage()
				sys.exit(0)
			if opcode in ('-e', '--experiment' ) :
				self.exp_file = oparg
				if not os.path.exists( self.exp_file ) :
					print("File", self.exp_file, "does not exist", file=sys.stderr)
					print("Aborting", file=sys.stderr)
					sys.exit(1)
			if opcode in ('-t', '--max-time' ) :
				try :
					self.max_time = int(oparg)
					if self.max_time <= 0 :
						print("Maximum time must be greater than zero", file=sys.stderr)
						sys.exit(1)
				except ValueError :
					print("Time must be an integer", file=sys.stderr)
					sys.exit(1)
			if opcode in ('-m', '--max-memory' ) :
				try :
					self.max_memory = int(oparg)
					if self.max_memory <= 0 :
						print("Maximum memory must be greater than zero", file=sys.stderr)
						sys.exit(1)
				except ValueError :
					print("Memory amount must be an integer", file=sys.stderr)
					sys.exit(1)
	

		if self.exp_file is None :
			print("No experiment file was specified!!", file=sys.stderr)
			usage()
			sys.exit(1)	
	
		os.system( 'tar jxvf %s'%self.exp_file )
		if not os.path.exists( 'domain.pddl' ) :
			print("No 'domain.pddl' file found in experiment file!", file=sys.stderr)
			usage()
			sys.exit(1)
		if not os.path.exists( 'template.pddl' ) :
			print("No 'template.pddl' file found in experiment file!", file=sys.stderr)
			usage()
			sys.exit(1)
		if not os.path.exists( 'hyps.dat' ) :
			print("No 'hyps.dat' file found in experiment file!", file=sys.stderr)
			usage()
			sys.exit(1)
		if not os.path.exists( 'obs.dat' ) :
			print("No 'obs.dat' file found in experiment file!", file=sys.stderr)
			usage()
			sys.exit(1)
		if not os.path.exists( 'real_hyp.dat' ) :
			print("No 'real_hyp.dat' file found in experiment file!", file=sys.stderr)
			usage()
			sys.exit(1)

	def print_options( self ) :
		def print_yes() : print("Yes", file=sys.stdout)
		def print_no() : print("No", file=sys.stdout)
		
		print("Options set", file=sys.stdout)
		print("===========", file=sys.stdout)
		print("Experiment File:", self.exp_file, file=sys.stdout)
		print("Max. Time Allowed", self.max_time, file=sys.stdout)
		print("Max. Memory Allowed", self.max_memory, file=sys.stdout)
