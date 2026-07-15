#!/bin/sh
#
# Makefile for FF v 1.0
#


####### FLAGS

TYPE	=
ADDONS	=

CC      = gcc

# Detect the host OS so the build works on both Linux and macOS.
UNAME_S := $(shell uname -s)

# This is 2010-era C: modern gcc/clang default to a newer standard and promote
# several legacy constructs to errors. Pin the dialect and downgrade those back
# to warnings so the sources still compile on both toolchains. -fcommon is
# needed because gcc 10+ and clang default to -fno-common.
CFLAGS	= -O2 -g $(TYPE) $(ADDONS) -fcommon -std=gnu89 \
	-Wno-implicit-function-declaration -Wno-error=implicit-function-declaration \
	-Wno-error=implicit-int -Wno-error=int-conversion \
	-Wno-error=incompatible-pointer-types -Wno-error=return-type
# -g -pg

# Static linking is only supported by the GNU toolchain; macOS ld has no
# crt0.o for -static, so we link dynamically there.
ifeq ($(UNAME_S),Linux)
STATIC = -static
else
STATIC =
endif

LIBS    = -lm


####### Files

PDDL_PARSER_SRC	= scan-fct_pddl.tab.c \
	scan-ops_pddl.tab.c \
	scan-probname.tab.c \
	lex.fct_pddl.c \
	lex.ops_pddl.c 

PDDL_PARSER_OBJ = scan-fct_pddl.tab.o \
	scan-ops_pddl.tab.o 


SOURCES 	= main.c \
	memory.c \
	output.c \
	parse.c \
	expressions.c \
	inst_pre.c \
	inst_easy.c \
	inst_hard.c \
	inst_final.c \
	relax.c \
	search.c \
	utility.c

LIB_SOURCES = libff.c \
	memory.c \
	output.c \
	parse.c \
	expressions.c \
	inst_pre.c \
	inst_easy.c \
	inst_hard.c \
	inst_final.c \
	relax.c \
	search.c \
	utility.c


OBJECTS 	= $(SOURCES:.c=.o)
LIB_OBJECTS	= $(LIB_SOURCES:.c=.o)

####### Implicit rules

.SUFFIXES:

.SUFFIXES: .c .o

.c.o:; $(CC) -c $(CFLAGS) $<

####### Build rules

libff: $(LIB_OBJECTS) $(PDDL_PARSER_OBJ)
	ar cru libff.a $(LIB_OBJECTS) $(PDDL_PARSER_OBJ)

ff: $(OBJECTS) $(PDDL_PARSER_OBJ)
	$(CC) $(STATIC) -o ff $(OBJECTS) $(PDDL_PARSER_OBJ) $(CFLAGS) $(LIBS)

# pddl syntax
scan-fct_pddl.tab.c: scan-fct_pddl.y lex.fct_pddl.c
	bison -pfct_pddl -bscan-fct_pddl scan-fct_pddl.y

scan-ops_pddl.tab.c: scan-ops_pddl.y lex.ops_pddl.c
	bison -pops_pddl -bscan-ops_pddl scan-ops_pddl.y

lex.fct_pddl.c: lex-fct_pddl.l
	flex -Pfct_pddl lex-fct_pddl.l

lex.ops_pddl.c: lex-ops_pddl.l
	flex -Pops_pddl lex-ops_pddl.l

test_lib: test_main.cxx
	g++ $(STATIC) -o test_lib test_main.cxx -lff -L./

# misc
clean:
	rm -f *.o *.bak *~ *% core *_pure_p9_c0_400.o.warnings test_lib \
        \#*\# $(RES_PARSER_SRC) $(PDDL_PARSER_SRC)

veryclean: clean
	rm -f ff H* J* K* L* O* graph.* *.symbex gmon.out \
	$(PDDL_PARSER_SRC) \
	lex.fct_pddl.c lex.ops_pddl.c lex.probname.c \
	*.output

depend:
	makedepend -- $(SOURCES)  $(LIB_SOURCES) $(PDDL_PARSER_SRC) test_main.cxx

lint:
	lclint -booltype Bool $(SOURCES) 2> output.lint

