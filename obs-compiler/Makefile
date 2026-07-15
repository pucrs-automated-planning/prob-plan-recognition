CC = g++
BISON = bison
FLEX = flex

# Detect the host OS so the build works on both Linux and macOS.
UNAME_S := $(shell uname -s)

NFF_TARGET = pr2plan

#CXXFLAGS = -g -Wall -Imod-metric-ff -DDEBUG -DPDDL_TYPE_CHECKING
CXXFLAGS = -O3 -Wall -Imod-metric-ff -DNDEBUG
LDFLAGS = -Lmod-metric-ff/
#EFENCE = -lefence
# Static linking is only supported by the GNU toolchain; macOS ld has no
# crt0.o for -static, so we link dynamically there.
ifeq ($(UNAME_S),Linux)
STATIC = -static
else
STATIC =
endif
LIBS = -lff $(EFENCE)

NFF_SOURCES = PDDL.cxx \
	pddl_fluent_set.cxx \
	pddl_string_table.cxx \
	bitarray.cxx \
	global_options.cxx \
	options.cxx \
	pr_obs_reader.cxx \
	pr_strips_mapping.cxx \
	strips_writer.cxx \
	act_obs.cxx \
	main.cxx

NFF_OBJECTS = $(NFF_SOURCES:.cxx=.o) 

# Implicit rules
#
.SUFFIXES:

.SUFFIXES: .cxx .C .o

.cxx.o:; $(CC) -o $@ -c $(CXXFLAGS) $<
.C.o:; $(CC) -o $@ -c $(CXXFLAGS) $<

# build rules

all : $(NFF_TARGET) 

$(NFF_TARGET) : $(PARSER_OBJ) $(NFF_OBJECTS)
	$(CC) -o $(NFF_TARGET) $(STATIC) $(PARSER_OBJ) $(NFF_OBJECTS) $(LDFLAGS) $(LIBS)

# dependencies
depend:
	# Updating dependencies
	@makedepend -- $(CXXFLAGS) -- $(NFF_SOURCES) $(MAIN_NFF_SOURCES)

# Cleaning
clean:
	rm -rf $(NFF_OBJECTS) $(NFF_TARGET) $(PARSER_SRC)  $(PARSER_HDR) *.o *.hh
# Run "make depend" to regenerate dependencies for your machine (needs makedepend).
