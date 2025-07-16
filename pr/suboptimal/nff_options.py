import getopt, os, sys

def usage() :
	print("Parameters:", file=sys.stderr)
	print("-d  --domain <file>              Planning Domain", file=sys.stderr)
	print("-i  --instance <file>            Planning Instance", file=sys.stderr)
	print("-Z  --zipped-problem <file>      Zipped Planning domain and instance", file=sys.stderr)
	print("-h  --help                       Get Help", file=sys.stderr)
	print("-t  --max-time <time>            Maximum allowed execution time (defaults to 1800 secs)", file=sys.stderr)
	print("-m  --max-memory <time>          Maximum allowed memory consumption (defaults to 1Gb)", file=sys.stderr)
	print("-1                               Use h^1 instead of h^2", file=sys.stderr)
	print("-2                               Use h_CL instead of h^2", file=sys.stderr)
	print("-P                               Compute Persists-With(p) for each layer in the planning graph", file=sys.stderr)
	print("-B                               Perform Branch & Bound search", file=sys.stderr)
	print("-C                               Constrain h^1 with active causal links", file=sys.stderr)
	print("-J                               Use Joint Persistency in the Label propagation", file=sys.stderr)
	print("-K                               Use causal link ranking based on Keep(p) potential causal links disturbed", file=sys.stderr)
	print(file=sys.stderr)
	print("Branching options:", file=sys.stderr)
	print("-a  --branch-C1                  Branch on C^1(s)", file=sys.stderr)
	print("-b  --branch-C2                  Branch on C^2(s)", file=sys.stderr)
	print("-c  --branch-C1-R                Branch on C^1(s) Reachable", file=sys.stderr)
	print("-e  --branch-C2-R                Branch on C^2(s) Reachable", file=sys.stderr)

class Program_Options :

	def __init__( self, args ) :
		try:
			opts, args = getopt.getopt(	args,
							"d:i:ht:m:12PBCabceJKZ:",
							["domain=",
							"instance=",
							"help",
							"max-time=",
							"max-memory=",
							"use-h1",
							"use-hcl",
							"compute-pw-at-each-layer",
							"branch-and-bound",
							"constrain-h1",
							"branch-C1",
							"branch-C1-R",
							"branch-C2",
							"joint-persistency",
							"rank-by-keeps",
							"zipped-problem="] )
		except getopt.GetoptError :
			print("Missing or incorrect parameters specified!", file=sys.stderr)
			usage()
			sys.exit(1)

		self.domain = None
		self.instance = None
		self.max_time = 1800
		self.max_memory = 1024
		self.use_h1 = False
		self.use_hcl = False
		self.pw_each_layer = False
		self.do_bnb = False
		self.constrain_h1 = False
		self.joint_persistency = False
		self.keep_based_ranking = False
		self.branch_opt = 0
		self.reachable = False
		self.zipped_problem = None

		for opcode, oparg in opts :
			if opcode in ( '-h', '--help' ) :
				print("Help invoked!", file=sys.stderr)
				usage()
				sys.exit(0)
			if opcode in ('-d', '--domain' ) :
				self.domain = oparg
				if not os.path.exists( self.domain ) :
					print("File", self.domain, "does not exist", file=sys.stderr)
					print("Aborting", file=sys.stderr)
					sys.exit(1)

			if opcode in ('-i', '--instance' ) :
				self.instance = oparg
				if not os.path.exists( self.instance ) :
					print("File", self.instance, "does not exist", file=sys.stderr)
					print("Aborting", file=sys.stderr)
					sys.exit(1)
			if opcode in ('-Z', '--zipped-file' ) :
				self.zipped_problem = oparg
				if not os.path.exists( self.zipped_problem ) or not '.zip' in self.zipped_problem :
					print("File", self.zipped_problem, "does not exist or hasn't zip extension", file=sys.stderr)
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
			if opcode in ('-1', '--use-h1' ) :
				self.use_h1 = True
			if opcode in ('-2', '--use-hcl' ) :
				self.use_hcl = True
			if opcode in ('-P', '--compute-pw-at-each-layer' ) :
				self.pw_each_layer = True
			if opcode in ('-B', '--branch-and-bound' ) :
				self.do_bnb = True
			if opcode in ('-C', '--constrain-h1' ) :
				self.constrain_h1 = True
			if opcode in ('-J', '--joint-persistency' ) :
				self.joint_persistency = True
			if opcode in ('-K', '--rank-by-keeps' ) :
				self.keep_based_ranking = True
			if opcode in ('-a', '--branch-C1' ) :
				self.branch_opt = 0
			if opcode in ('-b', '--branch-C2' ) :
				self.branch_opt = 1
			if opcode in ('-c', '--branch-C1-R' ) :
				self.reachable = True
			if opcode in ('-e', '--branch-C2-R' ) :
				self.reachable = True				
				self.branch_opt = 1
		if self.zipped_problem is not None :
			os.system( 'unzip -o %s'%self.zipped_problem )
			if not os.path.exists( 'MANIFEST' ) :
				print("No MANIFEST file found in local directory", file=sys.stderr)
				usage()
				sys.exit(1)
			manifest_fo = open( 'MANIFEST' )
			for line in manifest_fo :
				line = line.strip()
				name, value = line.split('=')
				if name == 'domain_file' :
					if not os.path.exists( value ) :
						print("Something wrong found in MANIFEST: domain_file %s not found in local directory"%value, file=sys.stderr)
						usage()
						sys.exit(1)
					self.domain = value
				if name == 'instance_file' :
					if not os.path.exists( value ) :
						print("Something wrong found in MANIFEST: instance_file %s not found in local directory"%value, file=sys.stderr)
						usage()
						sys.exit(1)
					self.instance = value
								
		if self.instance is None :
			print("You need to specify an experiment descriptor as input", file=sys.stderr)
			usage()
			sys.exit(1)

	def print_options( self ) :
		def print_yes() : print("Yes", file=sys.stdout)
		def print_no() : print("No", file=sys.stdout)
		
		print("Options set", file=sys.stdout)
		print("===========", file=sys.stdout)
		print("Domain File:", self.domain, file=sys.stdout)
		print("Instance File:", self.instance, file=sys.stdout)
		print("Max. Time Allowed", self.max_time, file=sys.stdout)
		print("Max. Memory Allowed", self.max_memory, file=sys.stdout)
