CC = g++
BISON = bison
FLEX = flex

NFF_TARGET = subopt_PR

CXXFLAGS = -g -Wall -Imod-metric-ff -DPDDL_TYPE_CHECKING
#CXXFLAGS = -O3 -Wall -Imod-metric-ff -DNDEBUG
LDFLAGS = -Lmod-metric-ff/
#EFENCE = -lefence
# STATIC = -static
LIBS = -lff $(EFENCE)

NFF_SOURCES = main-PR.cxx \
	nff_options.cxx \
	PDDL.cxx \
	pddl_fluent_set.cxx \
	pddl_string_table.cxx \
	bitarray.cxx \
	nff_h_add_plus.cxx \
	nff_h_add.cxx \
	nff_h2.cxx \
	nff_state.cxx \
	nff_c3_bfs.cxx \
	nff_h1.cxx \
	nff_const_h1.cxx \
	nff_ext_state.cxx \
	nff_prop_util.cxx \
	nff.cxx \
	nff_node.cxx \
	nff_dfs_node.cxx \
	global_options.cxx \
	nff_algobase.cxx \
	nff_c3_at_bfs.cxx \
	nff_relaxed_plan.cxx \
	nff_best_supporter.cxx \
	nff_pb_best_supporter.cxx \
	nff_prim_best_supporter.cxx \
	nff_hadd_best_supporter.cxx \
	nff_hsa_best_supporter.cxx \
	nff_rp_heuristic.cxx \
	nff_heuristic_adapter.cxx \
	nff_harp_adapter.cxx \
	nff_min_adapter.cxx \
	nff_helpful.cxx \
	nff_bfs.cxx


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
	@cp $(NFF_TARGET) ../../plan-libs

# dependencies
depend:
	# Updating dependencies
	@makedepend -- $(CXXFLAGS) -- $(NFF_SOURCES)

# Cleaning
clean:
	rm -rf $(NFF_OBJECTS) $(NFF_TARGET) $(PARSER_SRC) $(PARSER_HDR) *.o *.hh
# DO NOT DELETE

main-PR.o: /usr/include/signal.h /usr/include/sys/cdefs.h
main-PR.o: /usr/include/sys/_symbol_aliasing.h
main-PR.o: /usr/include/sys/_posix_availability.h /usr/include/_types.h
main-PR.o: /usr/include/sys/_types.h /usr/include/machine/_types.h
main-PR.o: /usr/include/i386/_types.h
main-PR.o: /usr/include/sys/_pthread/_pthread_types.h
main-PR.o: /usr/include/sys/signal.h /usr/include/sys/appleapiopts.h
main-PR.o: /usr/include/Availability.h /usr/include/AvailabilityInternal.h
main-PR.o: /usr/include/machine/signal.h /usr/include/i386/signal.h
main-PR.o: /usr/include/machine/_mcontext.h /usr/include/i386/_mcontext.h
main-PR.o: /usr/include/mach/i386/_structs.h
main-PR.o: /usr/include/sys/_pthread/_pthread_attr_t.h
main-PR.o: /usr/include/sys/_types/_sigaltstack.h
main-PR.o: /usr/include/sys/_types/_ucontext.h
main-PR.o: /usr/include/sys/_types/_pid_t.h
main-PR.o: /usr/include/sys/_types/_sigset_t.h
main-PR.o: /usr/include/sys/_types/_size_t.h /usr/include/sys/_types/_uid_t.h
main-PR.o: /usr/include/sys/_pthread/_pthread_t.h utils.hxx
main-PR.o: /usr/include/sys/times.h /usr/include/sys/_types/_clock_t.h
main-PR.o: /usr/include/sys/resource.h /usr/include/stdint.h
main-PR.o: /usr/include/sys/_types/_int8_t.h
main-PR.o: /usr/include/sys/_types/_int16_t.h
main-PR.o: /usr/include/sys/_types/_int32_t.h
main-PR.o: /usr/include/sys/_types/_int64_t.h /usr/include/_types/_uint8_t.h
main-PR.o: /usr/include/_types/_uint16_t.h /usr/include/_types/_uint32_t.h
main-PR.o: /usr/include/_types/_uint64_t.h
main-PR.o: /usr/include/sys/_types/_intptr_t.h
main-PR.o: /usr/include/sys/_types/_uintptr_t.h
main-PR.o: /usr/include/_types/_intmax_t.h /usr/include/_types/_uintmax_t.h
main-PR.o: /usr/include/sys/_types/_timeval.h /usr/include/sys/_types/_id_t.h
main-PR.o: /usr/include/unistd.h /usr/include/sys/unistd.h
main-PR.o: /usr/include/sys/_types/_posix_vdisable.h
main-PR.o: /usr/include/sys/_types/_seek_set.h
main-PR.o: /usr/include/sys/_types/_ssize_t.h
main-PR.o: /usr/include/sys/_types/_gid_t.h /usr/include/sys/_types/_off_t.h
main-PR.o: /usr/include/sys/_types/_useconds_t.h
main-PR.o: /usr/include/sys/_types/_null.h /usr/include/sys/select.h
main-PR.o: /usr/include/sys/_types/_fd_def.h
main-PR.o: /usr/include/sys/_types/_timespec.h
main-PR.o: /usr/include/sys/_types/_time_t.h
main-PR.o: /usr/include/sys/_types/_suseconds_t.h
main-PR.o: /usr/include/sys/_types/_fd_setsize.h
main-PR.o: /usr/include/sys/_types/_fd_set.h
main-PR.o: /usr/include/sys/_types/_fd_clr.h
main-PR.o: /usr/include/sys/_types/_fd_isset.h
main-PR.o: /usr/include/sys/_types/_fd_zero.h
main-PR.o: /usr/include/sys/_types/_fd_copy.h /usr/include/sys/_select.h
main-PR.o: /usr/include/sys/_types/_dev_t.h /usr/include/sys/_types/_mode_t.h
main-PR.o: /usr/include/sys/_types/_uuid_t.h /usr/include/gethostuuid.h
main-PR.o: PDDL.hxx pddl_basic_types.hxx pddl_string_table.hxx
main-PR.o: pddl_fluent_set.hxx bitarray.hxx nff_logic.hxx nff_options.hxx
main-PR.o: nff_h2.hxx ext_math.hxx nff.hxx nff_state.hxx
main-PR.o: nff_hsa_best_supporter.hxx nff_pb_best_supporter.hxx
main-PR.o: nff_best_supporter.hxx nff_relaxed_plan.hxx nff_harp_adapter.hxx
main-PR.o: nff_heuristic_adapter.hxx nff_heuristic.hxx nff_rp_heuristic.hxx
main-PR.o: nff_helpful.hxx nff_ehc.hxx nff_dfs_node.hxx jenkins_12bit.hxx
main-PR.o: pddl_fluent_table.hxx nff_algobase.hxx nff_bfs.hxx nff_node.hxx
nff_options.o: nff_options.hxx global_options.hxx /usr/include/getopt.h
nff_options.o: /usr/include/sys/cdefs.h /usr/include/sys/_symbol_aliasing.h
nff_options.o: /usr/include/sys/_posix_availability.h /usr/include/unistd.h
nff_options.o: /usr/include/_types.h /usr/include/sys/_types.h
nff_options.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
nff_options.o: /usr/include/sys/_pthread/_pthread_types.h
nff_options.o: /usr/include/sys/unistd.h
nff_options.o: /usr/include/sys/_types/_posix_vdisable.h
nff_options.o: /usr/include/sys/_types/_seek_set.h
nff_options.o: /usr/include/sys/_types/_size_t.h
nff_options.o: /usr/include/_types/_uint64_t.h /usr/include/Availability.h
nff_options.o: /usr/include/AvailabilityInternal.h
nff_options.o: /usr/include/sys/_types/_ssize_t.h
nff_options.o: /usr/include/sys/_types/_uid_t.h
nff_options.o: /usr/include/sys/_types/_gid_t.h
nff_options.o: /usr/include/sys/_types/_intptr_t.h
nff_options.o: /usr/include/sys/_types/_off_t.h
nff_options.o: /usr/include/sys/_types/_pid_t.h
nff_options.o: /usr/include/sys/_types/_useconds_t.h
nff_options.o: /usr/include/sys/_types/_null.h /usr/include/sys/select.h
nff_options.o: /usr/include/sys/appleapiopts.h
nff_options.o: /usr/include/sys/_types/_fd_def.h
nff_options.o: /usr/include/sys/_types/_timespec.h
nff_options.o: /usr/include/sys/_types/_timeval.h
nff_options.o: /usr/include/sys/_types/_time_t.h
nff_options.o: /usr/include/sys/_types/_suseconds_t.h
nff_options.o: /usr/include/sys/_types/_sigset_t.h
nff_options.o: /usr/include/sys/_types/_fd_setsize.h
nff_options.o: /usr/include/sys/_types/_fd_set.h
nff_options.o: /usr/include/sys/_types/_fd_clr.h
nff_options.o: /usr/include/sys/_types/_fd_isset.h
nff_options.o: /usr/include/sys/_types/_fd_zero.h
nff_options.o: /usr/include/sys/_types/_fd_copy.h /usr/include/sys/_select.h
nff_options.o: /usr/include/sys/_types/_dev_t.h
nff_options.o: /usr/include/sys/_types/_mode_t.h
nff_options.o: /usr/include/sys/_types/_uuid_t.h /usr/include/gethostuuid.h
PDDL.o: PDDL.hxx pddl_basic_types.hxx pddl_string_table.hxx
PDDL.o: pddl_fluent_set.hxx bitarray.hxx nff_logic.hxx /usr/include/stdint.h
PDDL.o: /usr/include/sys/_types/_int8_t.h /usr/include/sys/_types/_int16_t.h
PDDL.o: /usr/include/sys/_types/_int32_t.h /usr/include/sys/_types/_int64_t.h
PDDL.o: /usr/include/_types/_uint8_t.h /usr/include/_types/_uint16_t.h
PDDL.o: /usr/include/_types/_uint32_t.h /usr/include/_types/_uint64_t.h
PDDL.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
PDDL.o: /usr/include/sys/_symbol_aliasing.h
PDDL.o: /usr/include/sys/_posix_availability.h /usr/include/machine/_types.h
PDDL.o: /usr/include/i386/_types.h /usr/include/sys/_pthread/_pthread_types.h
PDDL.o: /usr/include/sys/_types/_intptr_t.h
PDDL.o: /usr/include/sys/_types/_uintptr_t.h /usr/include/_types/_intmax_t.h
PDDL.o: /usr/include/_types/_uintmax_t.h nff_h2.hxx ext_math.hxx nff.hxx
PDDL.o: nff_state.hxx utils.hxx /usr/include/sys/times.h
PDDL.o: /usr/include/sys/appleapiopts.h /usr/include/sys/_types/_clock_t.h
PDDL.o: /usr/include/sys/resource.h /usr/include/Availability.h
PDDL.o: /usr/include/AvailabilityInternal.h
PDDL.o: /usr/include/sys/_types/_timeval.h /usr/include/sys/_types/_id_t.h
PDDL.o: /usr/include/unistd.h /usr/include/_types.h /usr/include/sys/unistd.h
PDDL.o: /usr/include/sys/_types/_posix_vdisable.h
PDDL.o: /usr/include/sys/_types/_seek_set.h /usr/include/sys/_types/_size_t.h
PDDL.o: /usr/include/sys/_types/_ssize_t.h /usr/include/sys/_types/_uid_t.h
PDDL.o: /usr/include/sys/_types/_gid_t.h /usr/include/sys/_types/_off_t.h
PDDL.o: /usr/include/sys/_types/_pid_t.h
PDDL.o: /usr/include/sys/_types/_useconds_t.h /usr/include/sys/_types/_null.h
PDDL.o: /usr/include/sys/select.h /usr/include/sys/_types/_fd_def.h
PDDL.o: /usr/include/sys/_types/_timespec.h /usr/include/sys/_types/_time_t.h
PDDL.o: /usr/include/sys/_types/_suseconds_t.h
PDDL.o: /usr/include/sys/_types/_sigset_t.h
PDDL.o: /usr/include/sys/_types/_fd_setsize.h
PDDL.o: /usr/include/sys/_types/_fd_set.h /usr/include/sys/_types/_fd_clr.h
PDDL.o: /usr/include/sys/_types/_fd_isset.h
PDDL.o: /usr/include/sys/_types/_fd_zero.h /usr/include/sys/_types/_fd_copy.h
PDDL.o: /usr/include/sys/_select.h /usr/include/sys/_types/_dev_t.h
PDDL.o: /usr/include/sys/_types/_mode_t.h /usr/include/sys/_types/_uuid_t.h
PDDL.o: /usr/include/gethostuuid.h global_options.hxx mod-metric-ff/libff.h
PDDL.o: mod-metric-ff/ff.h /usr/include/stdlib.h /usr/include/sys/wait.h
PDDL.o: /usr/include/sys/signal.h /usr/include/machine/signal.h
PDDL.o: /usr/include/i386/signal.h /usr/include/machine/_mcontext.h
PDDL.o: /usr/include/i386/_mcontext.h /usr/include/mach/i386/_structs.h
PDDL.o: /usr/include/sys/_pthread/_pthread_attr_t.h
PDDL.o: /usr/include/sys/_types/_sigaltstack.h
PDDL.o: /usr/include/sys/_types/_ucontext.h /usr/include/machine/endian.h
PDDL.o: /usr/include/i386/endian.h /usr/include/sys/_endian.h
PDDL.o: /usr/include/libkern/_OSByteOrder.h
PDDL.o: /usr/include/libkern/i386/_OSByteOrder.h /usr/include/alloca.h
PDDL.o: /usr/include/sys/_types/_ct_rune_t.h
PDDL.o: /usr/include/sys/_types/_rune_t.h /usr/include/sys/_types/_wchar_t.h
PDDL.o: /usr/include/machine/types.h /usr/include/i386/types.h
PDDL.o: /usr/include/sys/_types/_u_int8_t.h
PDDL.o: /usr/include/sys/_types/_u_int16_t.h
PDDL.o: /usr/include/sys/_types/_u_int32_t.h
PDDL.o: /usr/include/sys/_types/_u_int64_t.h /usr/include/stdio.h
PDDL.o: /usr/include/sys/_types/_va_list.h /usr/include/sys/stdio.h
PDDL.o: /usr/include/secure/_stdio.h /usr/include/secure/_common.h
PDDL.o: /usr/include/strings.h /usr/include/string.h
PDDL.o: /usr/include/sys/_types/_rsize_t.h /usr/include/sys/_types/_errno_t.h
PDDL.o: /usr/include/secure/_string.h /usr/include/ctype.h
PDDL.o: /usr/include/runetype.h /usr/include/sys/_types/_wint_t.h
PDDL.o: /usr/include/sys/types.h /usr/include/sys/_types/_blkcnt_t.h
PDDL.o: /usr/include/sys/_types/_blksize_t.h
PDDL.o: /usr/include/sys/_types/_in_addr_t.h
PDDL.o: /usr/include/sys/_types/_in_port_t.h /usr/include/sys/_types/_ino_t.h
PDDL.o: /usr/include/sys/_types/_ino64_t.h /usr/include/sys/_types/_key_t.h
PDDL.o: /usr/include/sys/_types/_nlink_t.h
PDDL.o: /usr/include/sys/_pthread/_pthread_cond_t.h
PDDL.o: /usr/include/sys/_pthread/_pthread_condattr_t.h
PDDL.o: /usr/include/sys/_pthread/_pthread_mutex_t.h
PDDL.o: /usr/include/sys/_pthread/_pthread_mutexattr_t.h
PDDL.o: /usr/include/sys/_pthread/_pthread_once_t.h
PDDL.o: /usr/include/sys/_pthread/_pthread_rwlock_t.h
PDDL.o: /usr/include/sys/_pthread/_pthread_rwlockattr_t.h
PDDL.o: /usr/include/sys/_pthread/_pthread_t.h
PDDL.o: /usr/include/sys/_pthread/_pthread_key_t.h
PDDL.o: /usr/include/sys/_types/_fsblkcnt_t.h
PDDL.o: /usr/include/sys/_types/_fsfilcnt_t.h /usr/include/sys/timeb.h
pddl_fluent_set.o: pddl_fluent_set.hxx bitarray.hxx
pddl_string_table.o: pddl_string_table.hxx pddl_basic_types.hxx
bitarray.o: bitarray.hxx
nff_h_add_plus.o: nff_h_add_plus.hxx nff_h_add.hxx ext_math.hxx PDDL.hxx
nff_h_add_plus.o: pddl_basic_types.hxx pddl_string_table.hxx
nff_h_add_plus.o: pddl_fluent_set.hxx bitarray.hxx nff_logic.hxx
nff_h_add_plus.o: /usr/include/stdint.h /usr/include/sys/_types/_int8_t.h
nff_h_add_plus.o: /usr/include/sys/_types/_int16_t.h
nff_h_add_plus.o: /usr/include/sys/_types/_int32_t.h
nff_h_add_plus.o: /usr/include/sys/_types/_int64_t.h
nff_h_add_plus.o: /usr/include/_types/_uint8_t.h
nff_h_add_plus.o: /usr/include/_types/_uint16_t.h
nff_h_add_plus.o: /usr/include/_types/_uint32_t.h
nff_h_add_plus.o: /usr/include/_types/_uint64_t.h /usr/include/sys/_types.h
nff_h_add_plus.o: /usr/include/sys/cdefs.h
nff_h_add_plus.o: /usr/include/sys/_symbol_aliasing.h
nff_h_add_plus.o: /usr/include/sys/_posix_availability.h
nff_h_add_plus.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
nff_h_add_plus.o: /usr/include/sys/_pthread/_pthread_types.h
nff_h_add_plus.o: /usr/include/sys/_types/_intptr_t.h
nff_h_add_plus.o: /usr/include/sys/_types/_uintptr_t.h
nff_h_add_plus.o: /usr/include/_types/_intmax_t.h
nff_h_add_plus.o: /usr/include/_types/_uintmax_t.h nff.hxx nff_state.hxx
nff_h_add.o: nff_h_add.hxx ext_math.hxx PDDL.hxx pddl_basic_types.hxx
nff_h_add.o: pddl_string_table.hxx pddl_fluent_set.hxx bitarray.hxx
nff_h_add.o: nff_logic.hxx /usr/include/stdint.h
nff_h_add.o: /usr/include/sys/_types/_int8_t.h
nff_h_add.o: /usr/include/sys/_types/_int16_t.h
nff_h_add.o: /usr/include/sys/_types/_int32_t.h
nff_h_add.o: /usr/include/sys/_types/_int64_t.h
nff_h_add.o: /usr/include/_types/_uint8_t.h /usr/include/_types/_uint16_t.h
nff_h_add.o: /usr/include/_types/_uint32_t.h /usr/include/_types/_uint64_t.h
nff_h_add.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
nff_h_add.o: /usr/include/sys/_symbol_aliasing.h
nff_h_add.o: /usr/include/sys/_posix_availability.h
nff_h_add.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
nff_h_add.o: /usr/include/sys/_pthread/_pthread_types.h
nff_h_add.o: /usr/include/sys/_types/_intptr_t.h
nff_h_add.o: /usr/include/sys/_types/_uintptr_t.h
nff_h_add.o: /usr/include/_types/_intmax_t.h /usr/include/_types/_uintmax_t.h
nff_h_add.o: nff.hxx nff_state.hxx
nff_h2.o: nff_h2.hxx ext_math.hxx PDDL.hxx pddl_basic_types.hxx
nff_h2.o: pddl_string_table.hxx pddl_fluent_set.hxx bitarray.hxx
nff_h2.o: nff_logic.hxx /usr/include/stdint.h
nff_h2.o: /usr/include/sys/_types/_int8_t.h
nff_h2.o: /usr/include/sys/_types/_int16_t.h
nff_h2.o: /usr/include/sys/_types/_int32_t.h
nff_h2.o: /usr/include/sys/_types/_int64_t.h /usr/include/_types/_uint8_t.h
nff_h2.o: /usr/include/_types/_uint16_t.h /usr/include/_types/_uint32_t.h
nff_h2.o: /usr/include/_types/_uint64_t.h /usr/include/sys/_types.h
nff_h2.o: /usr/include/sys/cdefs.h /usr/include/sys/_symbol_aliasing.h
nff_h2.o: /usr/include/sys/_posix_availability.h
nff_h2.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
nff_h2.o: /usr/include/sys/_pthread/_pthread_types.h
nff_h2.o: /usr/include/sys/_types/_intptr_t.h
nff_h2.o: /usr/include/sys/_types/_uintptr_t.h
nff_h2.o: /usr/include/_types/_intmax_t.h /usr/include/_types/_uintmax_t.h
nff_h2.o: nff.hxx nff_state.hxx nff_h1.hxx square_matrix.hxx nff_options.hxx
nff_state.o: nff_state.hxx PDDL.hxx pddl_basic_types.hxx
nff_state.o: pddl_string_table.hxx pddl_fluent_set.hxx bitarray.hxx
nff_state.o: nff_logic.hxx /usr/include/stdint.h
nff_state.o: /usr/include/sys/_types/_int8_t.h
nff_state.o: /usr/include/sys/_types/_int16_t.h
nff_state.o: /usr/include/sys/_types/_int32_t.h
nff_state.o: /usr/include/sys/_types/_int64_t.h
nff_state.o: /usr/include/_types/_uint8_t.h /usr/include/_types/_uint16_t.h
nff_state.o: /usr/include/_types/_uint32_t.h /usr/include/_types/_uint64_t.h
nff_state.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
nff_state.o: /usr/include/sys/_symbol_aliasing.h
nff_state.o: /usr/include/sys/_posix_availability.h
nff_state.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
nff_state.o: /usr/include/sys/_pthread/_pthread_types.h
nff_state.o: /usr/include/sys/_types/_intptr_t.h
nff_state.o: /usr/include/sys/_types/_uintptr_t.h
nff_state.o: /usr/include/_types/_intmax_t.h /usr/include/_types/_uintmax_t.h
nff_c3_bfs.o: nff_c3_bfs.hxx nff_node.hxx nff.hxx PDDL.hxx
nff_c3_bfs.o: pddl_basic_types.hxx pddl_string_table.hxx pddl_fluent_set.hxx
nff_c3_bfs.o: bitarray.hxx nff_logic.hxx /usr/include/stdint.h
nff_c3_bfs.o: /usr/include/sys/_types/_int8_t.h
nff_c3_bfs.o: /usr/include/sys/_types/_int16_t.h
nff_c3_bfs.o: /usr/include/sys/_types/_int32_t.h
nff_c3_bfs.o: /usr/include/sys/_types/_int64_t.h
nff_c3_bfs.o: /usr/include/_types/_uint8_t.h /usr/include/_types/_uint16_t.h
nff_c3_bfs.o: /usr/include/_types/_uint32_t.h /usr/include/_types/_uint64_t.h
nff_c3_bfs.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
nff_c3_bfs.o: /usr/include/sys/_symbol_aliasing.h
nff_c3_bfs.o: /usr/include/sys/_posix_availability.h
nff_c3_bfs.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
nff_c3_bfs.o: /usr/include/sys/_pthread/_pthread_types.h
nff_c3_bfs.o: /usr/include/sys/_types/_intptr_t.h
nff_c3_bfs.o: /usr/include/sys/_types/_uintptr_t.h
nff_c3_bfs.o: /usr/include/_types/_intmax_t.h
nff_c3_bfs.o: /usr/include/_types/_uintmax_t.h nff_state.hxx
nff_c3_bfs.o: jenkins_12bit.hxx nff_h_add_plus.hxx nff_h_add.hxx ext_math.hxx
nff_c3_bfs.o: nff_h2.hxx pddl_fluent_table.hxx nff_options.hxx
nff_h1.o: nff_h1.hxx ext_math.hxx PDDL.hxx pddl_basic_types.hxx
nff_h1.o: pddl_string_table.hxx pddl_fluent_set.hxx bitarray.hxx
nff_h1.o: nff_logic.hxx /usr/include/stdint.h
nff_h1.o: /usr/include/sys/_types/_int8_t.h
nff_h1.o: /usr/include/sys/_types/_int16_t.h
nff_h1.o: /usr/include/sys/_types/_int32_t.h
nff_h1.o: /usr/include/sys/_types/_int64_t.h /usr/include/_types/_uint8_t.h
nff_h1.o: /usr/include/_types/_uint16_t.h /usr/include/_types/_uint32_t.h
nff_h1.o: /usr/include/_types/_uint64_t.h /usr/include/sys/_types.h
nff_h1.o: /usr/include/sys/cdefs.h /usr/include/sys/_symbol_aliasing.h
nff_h1.o: /usr/include/sys/_posix_availability.h
nff_h1.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
nff_h1.o: /usr/include/sys/_pthread/_pthread_types.h
nff_h1.o: /usr/include/sys/_types/_intptr_t.h
nff_h1.o: /usr/include/sys/_types/_uintptr_t.h
nff_h1.o: /usr/include/_types/_intmax_t.h /usr/include/_types/_uintmax_t.h
nff_h1.o: nff.hxx nff_state.hxx
nff_const_h1.o: nff_const_h1.hxx ext_math.hxx PDDL.hxx pddl_basic_types.hxx
nff_const_h1.o: pddl_string_table.hxx pddl_fluent_set.hxx bitarray.hxx
nff_const_h1.o: nff_logic.hxx /usr/include/stdint.h
nff_const_h1.o: /usr/include/sys/_types/_int8_t.h
nff_const_h1.o: /usr/include/sys/_types/_int16_t.h
nff_const_h1.o: /usr/include/sys/_types/_int32_t.h
nff_const_h1.o: /usr/include/sys/_types/_int64_t.h
nff_const_h1.o: /usr/include/_types/_uint8_t.h
nff_const_h1.o: /usr/include/_types/_uint16_t.h
nff_const_h1.o: /usr/include/_types/_uint32_t.h
nff_const_h1.o: /usr/include/_types/_uint64_t.h /usr/include/sys/_types.h
nff_const_h1.o: /usr/include/sys/cdefs.h /usr/include/sys/_symbol_aliasing.h
nff_const_h1.o: /usr/include/sys/_posix_availability.h
nff_const_h1.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
nff_const_h1.o: /usr/include/sys/_pthread/_pthread_types.h
nff_const_h1.o: /usr/include/sys/_types/_intptr_t.h
nff_const_h1.o: /usr/include/sys/_types/_uintptr_t.h
nff_const_h1.o: /usr/include/_types/_intmax_t.h
nff_const_h1.o: /usr/include/_types/_uintmax_t.h nff.hxx nff_state.hxx
nff_ext_state.o: nff_ext_state.hxx PDDL.hxx pddl_basic_types.hxx
nff_ext_state.o: pddl_string_table.hxx pddl_fluent_set.hxx bitarray.hxx
nff_ext_state.o: nff_logic.hxx /usr/include/stdint.h
nff_ext_state.o: /usr/include/sys/_types/_int8_t.h
nff_ext_state.o: /usr/include/sys/_types/_int16_t.h
nff_ext_state.o: /usr/include/sys/_types/_int32_t.h
nff_ext_state.o: /usr/include/sys/_types/_int64_t.h
nff_ext_state.o: /usr/include/_types/_uint8_t.h
nff_ext_state.o: /usr/include/_types/_uint16_t.h
nff_ext_state.o: /usr/include/_types/_uint32_t.h
nff_ext_state.o: /usr/include/_types/_uint64_t.h /usr/include/sys/_types.h
nff_ext_state.o: /usr/include/sys/cdefs.h /usr/include/sys/_symbol_aliasing.h
nff_ext_state.o: /usr/include/sys/_posix_availability.h
nff_ext_state.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
nff_ext_state.o: /usr/include/sys/_pthread/_pthread_types.h
nff_ext_state.o: /usr/include/sys/_types/_intptr_t.h
nff_ext_state.o: /usr/include/sys/_types/_uintptr_t.h
nff_ext_state.o: /usr/include/_types/_intmax_t.h
nff_ext_state.o: /usr/include/_types/_uintmax_t.h nff.hxx nff_state.hxx
nff_prop_util.o: nff_prop_util.hxx nff_ext_state.hxx PDDL.hxx
nff_prop_util.o: pddl_basic_types.hxx pddl_string_table.hxx
nff_prop_util.o: pddl_fluent_set.hxx bitarray.hxx nff_logic.hxx
nff_prop_util.o: /usr/include/stdint.h /usr/include/sys/_types/_int8_t.h
nff_prop_util.o: /usr/include/sys/_types/_int16_t.h
nff_prop_util.o: /usr/include/sys/_types/_int32_t.h
nff_prop_util.o: /usr/include/sys/_types/_int64_t.h
nff_prop_util.o: /usr/include/_types/_uint8_t.h
nff_prop_util.o: /usr/include/_types/_uint16_t.h
nff_prop_util.o: /usr/include/_types/_uint32_t.h
nff_prop_util.o: /usr/include/_types/_uint64_t.h /usr/include/sys/_types.h
nff_prop_util.o: /usr/include/sys/cdefs.h /usr/include/sys/_symbol_aliasing.h
nff_prop_util.o: /usr/include/sys/_posix_availability.h
nff_prop_util.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
nff_prop_util.o: /usr/include/sys/_pthread/_pthread_types.h
nff_prop_util.o: /usr/include/sys/_types/_intptr_t.h
nff_prop_util.o: /usr/include/sys/_types/_uintptr_t.h
nff_prop_util.o: /usr/include/_types/_intmax_t.h
nff_prop_util.o: /usr/include/_types/_uintmax_t.h nff.hxx nff_state.hxx
nff.o: nff.hxx PDDL.hxx pddl_basic_types.hxx pddl_string_table.hxx
nff.o: pddl_fluent_set.hxx bitarray.hxx nff_logic.hxx /usr/include/stdint.h
nff.o: /usr/include/sys/_types/_int8_t.h /usr/include/sys/_types/_int16_t.h
nff.o: /usr/include/sys/_types/_int32_t.h /usr/include/sys/_types/_int64_t.h
nff.o: /usr/include/_types/_uint8_t.h /usr/include/_types/_uint16_t.h
nff.o: /usr/include/_types/_uint32_t.h /usr/include/_types/_uint64_t.h
nff.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
nff.o: /usr/include/sys/_symbol_aliasing.h
nff.o: /usr/include/sys/_posix_availability.h /usr/include/machine/_types.h
nff.o: /usr/include/i386/_types.h /usr/include/sys/_pthread/_pthread_types.h
nff.o: /usr/include/sys/_types/_intptr_t.h
nff.o: /usr/include/sys/_types/_uintptr_t.h /usr/include/_types/_intmax_t.h
nff.o: /usr/include/_types/_uintmax_t.h
nff_node.o: nff_node.hxx nff.hxx PDDL.hxx pddl_basic_types.hxx
nff_node.o: pddl_string_table.hxx pddl_fluent_set.hxx bitarray.hxx
nff_node.o: nff_logic.hxx /usr/include/stdint.h
nff_node.o: /usr/include/sys/_types/_int8_t.h
nff_node.o: /usr/include/sys/_types/_int16_t.h
nff_node.o: /usr/include/sys/_types/_int32_t.h
nff_node.o: /usr/include/sys/_types/_int64_t.h /usr/include/_types/_uint8_t.h
nff_node.o: /usr/include/_types/_uint16_t.h /usr/include/_types/_uint32_t.h
nff_node.o: /usr/include/_types/_uint64_t.h /usr/include/sys/_types.h
nff_node.o: /usr/include/sys/cdefs.h /usr/include/sys/_symbol_aliasing.h
nff_node.o: /usr/include/sys/_posix_availability.h
nff_node.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
nff_node.o: /usr/include/sys/_pthread/_pthread_types.h
nff_node.o: /usr/include/sys/_types/_intptr_t.h
nff_node.o: /usr/include/sys/_types/_uintptr_t.h
nff_node.o: /usr/include/_types/_intmax_t.h /usr/include/_types/_uintmax_t.h
nff_node.o: nff_state.hxx jenkins_12bit.hxx
nff_dfs_node.o: nff_dfs_node.hxx nff.hxx PDDL.hxx pddl_basic_types.hxx
nff_dfs_node.o: pddl_string_table.hxx pddl_fluent_set.hxx bitarray.hxx
nff_dfs_node.o: nff_logic.hxx /usr/include/stdint.h
nff_dfs_node.o: /usr/include/sys/_types/_int8_t.h
nff_dfs_node.o: /usr/include/sys/_types/_int16_t.h
nff_dfs_node.o: /usr/include/sys/_types/_int32_t.h
nff_dfs_node.o: /usr/include/sys/_types/_int64_t.h
nff_dfs_node.o: /usr/include/_types/_uint8_t.h
nff_dfs_node.o: /usr/include/_types/_uint16_t.h
nff_dfs_node.o: /usr/include/_types/_uint32_t.h
nff_dfs_node.o: /usr/include/_types/_uint64_t.h /usr/include/sys/_types.h
nff_dfs_node.o: /usr/include/sys/cdefs.h /usr/include/sys/_symbol_aliasing.h
nff_dfs_node.o: /usr/include/sys/_posix_availability.h
nff_dfs_node.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
nff_dfs_node.o: /usr/include/sys/_pthread/_pthread_types.h
nff_dfs_node.o: /usr/include/sys/_types/_intptr_t.h
nff_dfs_node.o: /usr/include/sys/_types/_uintptr_t.h
nff_dfs_node.o: /usr/include/_types/_intmax_t.h
nff_dfs_node.o: /usr/include/_types/_uintmax_t.h nff_state.hxx
nff_dfs_node.o: jenkins_12bit.hxx
global_options.o: global_options.hxx
nff_algobase.o: nff_algobase.hxx nff.hxx PDDL.hxx pddl_basic_types.hxx
nff_algobase.o: pddl_string_table.hxx pddl_fluent_set.hxx bitarray.hxx
nff_algobase.o: nff_logic.hxx /usr/include/stdint.h
nff_algobase.o: /usr/include/sys/_types/_int8_t.h
nff_algobase.o: /usr/include/sys/_types/_int16_t.h
nff_algobase.o: /usr/include/sys/_types/_int32_t.h
nff_algobase.o: /usr/include/sys/_types/_int64_t.h
nff_algobase.o: /usr/include/_types/_uint8_t.h
nff_algobase.o: /usr/include/_types/_uint16_t.h
nff_algobase.o: /usr/include/_types/_uint32_t.h
nff_algobase.o: /usr/include/_types/_uint64_t.h /usr/include/sys/_types.h
nff_algobase.o: /usr/include/sys/cdefs.h /usr/include/sys/_symbol_aliasing.h
nff_algobase.o: /usr/include/sys/_posix_availability.h
nff_algobase.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
nff_algobase.o: /usr/include/sys/_pthread/_pthread_types.h
nff_algobase.o: /usr/include/sys/_types/_intptr_t.h
nff_algobase.o: /usr/include/sys/_types/_uintptr_t.h
nff_algobase.o: /usr/include/_types/_intmax_t.h
nff_algobase.o: /usr/include/_types/_uintmax_t.h
nff_c3_at_bfs.o: nff_c3_at_bfs.hxx nff_node.hxx nff.hxx PDDL.hxx
nff_c3_at_bfs.o: pddl_basic_types.hxx pddl_string_table.hxx
nff_c3_at_bfs.o: pddl_fluent_set.hxx bitarray.hxx nff_logic.hxx
nff_c3_at_bfs.o: /usr/include/stdint.h /usr/include/sys/_types/_int8_t.h
nff_c3_at_bfs.o: /usr/include/sys/_types/_int16_t.h
nff_c3_at_bfs.o: /usr/include/sys/_types/_int32_t.h
nff_c3_at_bfs.o: /usr/include/sys/_types/_int64_t.h
nff_c3_at_bfs.o: /usr/include/_types/_uint8_t.h
nff_c3_at_bfs.o: /usr/include/_types/_uint16_t.h
nff_c3_at_bfs.o: /usr/include/_types/_uint32_t.h
nff_c3_at_bfs.o: /usr/include/_types/_uint64_t.h /usr/include/sys/_types.h
nff_c3_at_bfs.o: /usr/include/sys/cdefs.h /usr/include/sys/_symbol_aliasing.h
nff_c3_at_bfs.o: /usr/include/sys/_posix_availability.h
nff_c3_at_bfs.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
nff_c3_at_bfs.o: /usr/include/sys/_pthread/_pthread_types.h
nff_c3_at_bfs.o: /usr/include/sys/_types/_intptr_t.h
nff_c3_at_bfs.o: /usr/include/sys/_types/_uintptr_t.h
nff_c3_at_bfs.o: /usr/include/_types/_intmax_t.h
nff_c3_at_bfs.o: /usr/include/_types/_uintmax_t.h nff_state.hxx
nff_c3_at_bfs.o: jenkins_12bit.hxx nff_h_add_plus.hxx nff_h_add.hxx
nff_c3_at_bfs.o: ext_math.hxx nff_h2.hxx pddl_fluent_table.hxx
nff_c3_at_bfs.o: nff_options.hxx
nff_relaxed_plan.o: nff_relaxed_plan.hxx PDDL.hxx pddl_basic_types.hxx
nff_relaxed_plan.o: pddl_string_table.hxx pddl_fluent_set.hxx bitarray.hxx
nff_relaxed_plan.o: nff_logic.hxx /usr/include/stdint.h
nff_relaxed_plan.o: /usr/include/sys/_types/_int8_t.h
nff_relaxed_plan.o: /usr/include/sys/_types/_int16_t.h
nff_relaxed_plan.o: /usr/include/sys/_types/_int32_t.h
nff_relaxed_plan.o: /usr/include/sys/_types/_int64_t.h
nff_relaxed_plan.o: /usr/include/_types/_uint8_t.h
nff_relaxed_plan.o: /usr/include/_types/_uint16_t.h
nff_relaxed_plan.o: /usr/include/_types/_uint32_t.h
nff_relaxed_plan.o: /usr/include/_types/_uint64_t.h /usr/include/sys/_types.h
nff_relaxed_plan.o: /usr/include/sys/cdefs.h
nff_relaxed_plan.o: /usr/include/sys/_symbol_aliasing.h
nff_relaxed_plan.o: /usr/include/sys/_posix_availability.h
nff_relaxed_plan.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
nff_relaxed_plan.o: /usr/include/sys/_pthread/_pthread_types.h
nff_relaxed_plan.o: /usr/include/sys/_types/_intptr_t.h
nff_relaxed_plan.o: /usr/include/sys/_types/_uintptr_t.h
nff_relaxed_plan.o: /usr/include/_types/_intmax_t.h
nff_relaxed_plan.o: /usr/include/_types/_uintmax_t.h nff.hxx nff_state.hxx
nff_best_supporter.o: nff_best_supporter.hxx nff.hxx PDDL.hxx
nff_best_supporter.o: pddl_basic_types.hxx pddl_string_table.hxx
nff_best_supporter.o: pddl_fluent_set.hxx bitarray.hxx nff_logic.hxx
nff_best_supporter.o: /usr/include/stdint.h /usr/include/sys/_types/_int8_t.h
nff_best_supporter.o: /usr/include/sys/_types/_int16_t.h
nff_best_supporter.o: /usr/include/sys/_types/_int32_t.h
nff_best_supporter.o: /usr/include/sys/_types/_int64_t.h
nff_best_supporter.o: /usr/include/_types/_uint8_t.h
nff_best_supporter.o: /usr/include/_types/_uint16_t.h
nff_best_supporter.o: /usr/include/_types/_uint32_t.h
nff_best_supporter.o: /usr/include/_types/_uint64_t.h
nff_best_supporter.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
nff_best_supporter.o: /usr/include/sys/_symbol_aliasing.h
nff_best_supporter.o: /usr/include/sys/_posix_availability.h
nff_best_supporter.o: /usr/include/machine/_types.h
nff_best_supporter.o: /usr/include/i386/_types.h
nff_best_supporter.o: /usr/include/sys/_pthread/_pthread_types.h
nff_best_supporter.o: /usr/include/sys/_types/_intptr_t.h
nff_best_supporter.o: /usr/include/sys/_types/_uintptr_t.h
nff_best_supporter.o: /usr/include/_types/_intmax_t.h
nff_best_supporter.o: /usr/include/_types/_uintmax_t.h nff_state.hxx
nff_best_supporter.o: nff_relaxed_plan.hxx nff_options.hxx
nff_pb_best_supporter.o: nff_pb_best_supporter.hxx nff_best_supporter.hxx
nff_pb_best_supporter.o: nff.hxx PDDL.hxx pddl_basic_types.hxx
nff_pb_best_supporter.o: pddl_string_table.hxx pddl_fluent_set.hxx
nff_pb_best_supporter.o: bitarray.hxx nff_logic.hxx /usr/include/stdint.h
nff_pb_best_supporter.o: /usr/include/sys/_types/_int8_t.h
nff_pb_best_supporter.o: /usr/include/sys/_types/_int16_t.h
nff_pb_best_supporter.o: /usr/include/sys/_types/_int32_t.h
nff_pb_best_supporter.o: /usr/include/sys/_types/_int64_t.h
nff_pb_best_supporter.o: /usr/include/_types/_uint8_t.h
nff_pb_best_supporter.o: /usr/include/_types/_uint16_t.h
nff_pb_best_supporter.o: /usr/include/_types/_uint32_t.h
nff_pb_best_supporter.o: /usr/include/_types/_uint64_t.h
nff_pb_best_supporter.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
nff_pb_best_supporter.o: /usr/include/sys/_symbol_aliasing.h
nff_pb_best_supporter.o: /usr/include/sys/_posix_availability.h
nff_pb_best_supporter.o: /usr/include/machine/_types.h
nff_pb_best_supporter.o: /usr/include/i386/_types.h
nff_pb_best_supporter.o: /usr/include/sys/_pthread/_pthread_types.h
nff_pb_best_supporter.o: /usr/include/sys/_types/_intptr_t.h
nff_pb_best_supporter.o: /usr/include/sys/_types/_uintptr_t.h
nff_pb_best_supporter.o: /usr/include/_types/_intmax_t.h
nff_pb_best_supporter.o: /usr/include/_types/_uintmax_t.h nff_state.hxx
nff_pb_best_supporter.o: nff_relaxed_plan.hxx
nff_prim_best_supporter.o: nff_prim_best_supporter.hxx nff_best_supporter.hxx
nff_prim_best_supporter.o: nff.hxx PDDL.hxx pddl_basic_types.hxx
nff_prim_best_supporter.o: pddl_string_table.hxx pddl_fluent_set.hxx
nff_prim_best_supporter.o: bitarray.hxx nff_logic.hxx /usr/include/stdint.h
nff_prim_best_supporter.o: /usr/include/sys/_types/_int8_t.h
nff_prim_best_supporter.o: /usr/include/sys/_types/_int16_t.h
nff_prim_best_supporter.o: /usr/include/sys/_types/_int32_t.h
nff_prim_best_supporter.o: /usr/include/sys/_types/_int64_t.h
nff_prim_best_supporter.o: /usr/include/_types/_uint8_t.h
nff_prim_best_supporter.o: /usr/include/_types/_uint16_t.h
nff_prim_best_supporter.o: /usr/include/_types/_uint32_t.h
nff_prim_best_supporter.o: /usr/include/_types/_uint64_t.h
nff_prim_best_supporter.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
nff_prim_best_supporter.o: /usr/include/sys/_symbol_aliasing.h
nff_prim_best_supporter.o: /usr/include/sys/_posix_availability.h
nff_prim_best_supporter.o: /usr/include/machine/_types.h
nff_prim_best_supporter.o: /usr/include/i386/_types.h
nff_prim_best_supporter.o: /usr/include/sys/_pthread/_pthread_types.h
nff_prim_best_supporter.o: /usr/include/sys/_types/_intptr_t.h
nff_prim_best_supporter.o: /usr/include/sys/_types/_uintptr_t.h
nff_prim_best_supporter.o: /usr/include/_types/_intmax_t.h
nff_prim_best_supporter.o: /usr/include/_types/_uintmax_t.h nff_state.hxx
nff_prim_best_supporter.o: nff_relaxed_plan.hxx
nff_hadd_best_supporter.o: nff_hadd_best_supporter.hxx
nff_hadd_best_supporter.o: nff_pb_best_supporter.hxx nff_best_supporter.hxx
nff_hadd_best_supporter.o: nff.hxx PDDL.hxx pddl_basic_types.hxx
nff_hadd_best_supporter.o: pddl_string_table.hxx pddl_fluent_set.hxx
nff_hadd_best_supporter.o: bitarray.hxx nff_logic.hxx /usr/include/stdint.h
nff_hadd_best_supporter.o: /usr/include/sys/_types/_int8_t.h
nff_hadd_best_supporter.o: /usr/include/sys/_types/_int16_t.h
nff_hadd_best_supporter.o: /usr/include/sys/_types/_int32_t.h
nff_hadd_best_supporter.o: /usr/include/sys/_types/_int64_t.h
nff_hadd_best_supporter.o: /usr/include/_types/_uint8_t.h
nff_hadd_best_supporter.o: /usr/include/_types/_uint16_t.h
nff_hadd_best_supporter.o: /usr/include/_types/_uint32_t.h
nff_hadd_best_supporter.o: /usr/include/_types/_uint64_t.h
nff_hadd_best_supporter.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
nff_hadd_best_supporter.o: /usr/include/sys/_symbol_aliasing.h
nff_hadd_best_supporter.o: /usr/include/sys/_posix_availability.h
nff_hadd_best_supporter.o: /usr/include/machine/_types.h
nff_hadd_best_supporter.o: /usr/include/i386/_types.h
nff_hadd_best_supporter.o: /usr/include/sys/_pthread/_pthread_types.h
nff_hadd_best_supporter.o: /usr/include/sys/_types/_intptr_t.h
nff_hadd_best_supporter.o: /usr/include/sys/_types/_uintptr_t.h
nff_hadd_best_supporter.o: /usr/include/_types/_intmax_t.h
nff_hadd_best_supporter.o: /usr/include/_types/_uintmax_t.h nff_state.hxx
nff_hadd_best_supporter.o: nff_relaxed_plan.hxx ext_math.hxx
nff_hsa_best_supporter.o: nff_hsa_best_supporter.hxx
nff_hsa_best_supporter.o: nff_pb_best_supporter.hxx nff_best_supporter.hxx
nff_hsa_best_supporter.o: nff.hxx PDDL.hxx pddl_basic_types.hxx
nff_hsa_best_supporter.o: pddl_string_table.hxx pddl_fluent_set.hxx
nff_hsa_best_supporter.o: bitarray.hxx nff_logic.hxx /usr/include/stdint.h
nff_hsa_best_supporter.o: /usr/include/sys/_types/_int8_t.h
nff_hsa_best_supporter.o: /usr/include/sys/_types/_int16_t.h
nff_hsa_best_supporter.o: /usr/include/sys/_types/_int32_t.h
nff_hsa_best_supporter.o: /usr/include/sys/_types/_int64_t.h
nff_hsa_best_supporter.o: /usr/include/_types/_uint8_t.h
nff_hsa_best_supporter.o: /usr/include/_types/_uint16_t.h
nff_hsa_best_supporter.o: /usr/include/_types/_uint32_t.h
nff_hsa_best_supporter.o: /usr/include/_types/_uint64_t.h
nff_hsa_best_supporter.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
nff_hsa_best_supporter.o: /usr/include/sys/_symbol_aliasing.h
nff_hsa_best_supporter.o: /usr/include/sys/_posix_availability.h
nff_hsa_best_supporter.o: /usr/include/machine/_types.h
nff_hsa_best_supporter.o: /usr/include/i386/_types.h
nff_hsa_best_supporter.o: /usr/include/sys/_pthread/_pthread_types.h
nff_hsa_best_supporter.o: /usr/include/sys/_types/_intptr_t.h
nff_hsa_best_supporter.o: /usr/include/sys/_types/_uintptr_t.h
nff_hsa_best_supporter.o: /usr/include/_types/_intmax_t.h
nff_hsa_best_supporter.o: /usr/include/_types/_uintmax_t.h nff_state.hxx
nff_hsa_best_supporter.o: nff_relaxed_plan.hxx ext_math.hxx nff_options.hxx
nff_rp_heuristic.o: nff_rp_heuristic.hxx nff_heuristic.hxx PDDL.hxx
nff_rp_heuristic.o: pddl_basic_types.hxx pddl_string_table.hxx
nff_rp_heuristic.o: pddl_fluent_set.hxx bitarray.hxx nff_logic.hxx
nff_rp_heuristic.o: /usr/include/stdint.h /usr/include/sys/_types/_int8_t.h
nff_rp_heuristic.o: /usr/include/sys/_types/_int16_t.h
nff_rp_heuristic.o: /usr/include/sys/_types/_int32_t.h
nff_rp_heuristic.o: /usr/include/sys/_types/_int64_t.h
nff_rp_heuristic.o: /usr/include/_types/_uint8_t.h
nff_rp_heuristic.o: /usr/include/_types/_uint16_t.h
nff_rp_heuristic.o: /usr/include/_types/_uint32_t.h
nff_rp_heuristic.o: /usr/include/_types/_uint64_t.h /usr/include/sys/_types.h
nff_rp_heuristic.o: /usr/include/sys/cdefs.h
nff_rp_heuristic.o: /usr/include/sys/_symbol_aliasing.h
nff_rp_heuristic.o: /usr/include/sys/_posix_availability.h
nff_rp_heuristic.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
nff_rp_heuristic.o: /usr/include/sys/_pthread/_pthread_types.h
nff_rp_heuristic.o: /usr/include/sys/_types/_intptr_t.h
nff_rp_heuristic.o: /usr/include/sys/_types/_uintptr_t.h
nff_rp_heuristic.o: /usr/include/_types/_intmax_t.h
nff_rp_heuristic.o: /usr/include/_types/_uintmax_t.h nff_state.hxx
nff_rp_heuristic.o: nff_best_supporter.hxx nff.hxx nff_relaxed_plan.hxx
nff_heuristic_adapter.o: nff_heuristic_adapter.hxx nff_heuristic.hxx PDDL.hxx
nff_heuristic_adapter.o: pddl_basic_types.hxx pddl_string_table.hxx
nff_heuristic_adapter.o: pddl_fluent_set.hxx bitarray.hxx nff_logic.hxx
nff_heuristic_adapter.o: /usr/include/stdint.h
nff_heuristic_adapter.o: /usr/include/sys/_types/_int8_t.h
nff_heuristic_adapter.o: /usr/include/sys/_types/_int16_t.h
nff_heuristic_adapter.o: /usr/include/sys/_types/_int32_t.h
nff_heuristic_adapter.o: /usr/include/sys/_types/_int64_t.h
nff_heuristic_adapter.o: /usr/include/_types/_uint8_t.h
nff_heuristic_adapter.o: /usr/include/_types/_uint16_t.h
nff_heuristic_adapter.o: /usr/include/_types/_uint32_t.h
nff_heuristic_adapter.o: /usr/include/_types/_uint64_t.h
nff_heuristic_adapter.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
nff_heuristic_adapter.o: /usr/include/sys/_symbol_aliasing.h
nff_heuristic_adapter.o: /usr/include/sys/_posix_availability.h
nff_heuristic_adapter.o: /usr/include/machine/_types.h
nff_heuristic_adapter.o: /usr/include/i386/_types.h
nff_heuristic_adapter.o: /usr/include/sys/_pthread/_pthread_types.h
nff_heuristic_adapter.o: /usr/include/sys/_types/_intptr_t.h
nff_heuristic_adapter.o: /usr/include/sys/_types/_uintptr_t.h
nff_heuristic_adapter.o: /usr/include/_types/_intmax_t.h
nff_heuristic_adapter.o: /usr/include/_types/_uintmax_t.h nff_state.hxx
nff_harp_adapter.o: nff_harp_adapter.hxx nff_heuristic_adapter.hxx
nff_harp_adapter.o: nff_heuristic.hxx PDDL.hxx pddl_basic_types.hxx
nff_harp_adapter.o: pddl_string_table.hxx pddl_fluent_set.hxx bitarray.hxx
nff_harp_adapter.o: nff_logic.hxx /usr/include/stdint.h
nff_harp_adapter.o: /usr/include/sys/_types/_int8_t.h
nff_harp_adapter.o: /usr/include/sys/_types/_int16_t.h
nff_harp_adapter.o: /usr/include/sys/_types/_int32_t.h
nff_harp_adapter.o: /usr/include/sys/_types/_int64_t.h
nff_harp_adapter.o: /usr/include/_types/_uint8_t.h
nff_harp_adapter.o: /usr/include/_types/_uint16_t.h
nff_harp_adapter.o: /usr/include/_types/_uint32_t.h
nff_harp_adapter.o: /usr/include/_types/_uint64_t.h /usr/include/sys/_types.h
nff_harp_adapter.o: /usr/include/sys/cdefs.h
nff_harp_adapter.o: /usr/include/sys/_symbol_aliasing.h
nff_harp_adapter.o: /usr/include/sys/_posix_availability.h
nff_harp_adapter.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
nff_harp_adapter.o: /usr/include/sys/_pthread/_pthread_types.h
nff_harp_adapter.o: /usr/include/sys/_types/_intptr_t.h
nff_harp_adapter.o: /usr/include/sys/_types/_uintptr_t.h
nff_harp_adapter.o: /usr/include/_types/_intmax_t.h
nff_harp_adapter.o: /usr/include/_types/_uintmax_t.h nff_state.hxx
nff_harp_adapter.o: nff_rp_heuristic.hxx nff_best_supporter.hxx nff.hxx
nff_harp_adapter.o: nff_relaxed_plan.hxx nff_helpful.hxx
nff_min_adapter.o: nff_min_adapter.hxx nff_heuristic_adapter.hxx
nff_min_adapter.o: nff_heuristic.hxx PDDL.hxx pddl_basic_types.hxx
nff_min_adapter.o: pddl_string_table.hxx pddl_fluent_set.hxx bitarray.hxx
nff_min_adapter.o: nff_logic.hxx /usr/include/stdint.h
nff_min_adapter.o: /usr/include/sys/_types/_int8_t.h
nff_min_adapter.o: /usr/include/sys/_types/_int16_t.h
nff_min_adapter.o: /usr/include/sys/_types/_int32_t.h
nff_min_adapter.o: /usr/include/sys/_types/_int64_t.h
nff_min_adapter.o: /usr/include/_types/_uint8_t.h
nff_min_adapter.o: /usr/include/_types/_uint16_t.h
nff_min_adapter.o: /usr/include/_types/_uint32_t.h
nff_min_adapter.o: /usr/include/_types/_uint64_t.h /usr/include/sys/_types.h
nff_min_adapter.o: /usr/include/sys/cdefs.h
nff_min_adapter.o: /usr/include/sys/_symbol_aliasing.h
nff_min_adapter.o: /usr/include/sys/_posix_availability.h
nff_min_adapter.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
nff_min_adapter.o: /usr/include/sys/_pthread/_pthread_types.h
nff_min_adapter.o: /usr/include/sys/_types/_intptr_t.h
nff_min_adapter.o: /usr/include/sys/_types/_uintptr_t.h
nff_min_adapter.o: /usr/include/_types/_intmax_t.h
nff_min_adapter.o: /usr/include/_types/_uintmax_t.h nff_state.hxx
nff_helpful.o: nff_state.hxx PDDL.hxx pddl_basic_types.hxx
nff_helpful.o: pddl_string_table.hxx pddl_fluent_set.hxx bitarray.hxx
nff_helpful.o: nff_logic.hxx /usr/include/stdint.h
nff_helpful.o: /usr/include/sys/_types/_int8_t.h
nff_helpful.o: /usr/include/sys/_types/_int16_t.h
nff_helpful.o: /usr/include/sys/_types/_int32_t.h
nff_helpful.o: /usr/include/sys/_types/_int64_t.h
nff_helpful.o: /usr/include/_types/_uint8_t.h /usr/include/_types/_uint16_t.h
nff_helpful.o: /usr/include/_types/_uint32_t.h
nff_helpful.o: /usr/include/_types/_uint64_t.h /usr/include/sys/_types.h
nff_helpful.o: /usr/include/sys/cdefs.h /usr/include/sys/_symbol_aliasing.h
nff_helpful.o: /usr/include/sys/_posix_availability.h
nff_helpful.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
nff_helpful.o: /usr/include/sys/_pthread/_pthread_types.h
nff_helpful.o: /usr/include/sys/_types/_intptr_t.h
nff_helpful.o: /usr/include/sys/_types/_uintptr_t.h
nff_helpful.o: /usr/include/_types/_intmax_t.h
nff_helpful.o: /usr/include/_types/_uintmax_t.h nff_helpful.hxx
nff_helpful.o: nff_relaxed_plan.hxx nff.hxx nff_best_supporter.hxx
nff_bfs.o: nff_bfs.hxx nff_node.hxx nff.hxx PDDL.hxx pddl_basic_types.hxx
nff_bfs.o: pddl_string_table.hxx pddl_fluent_set.hxx bitarray.hxx
nff_bfs.o: nff_logic.hxx /usr/include/stdint.h
nff_bfs.o: /usr/include/sys/_types/_int8_t.h
nff_bfs.o: /usr/include/sys/_types/_int16_t.h
nff_bfs.o: /usr/include/sys/_types/_int32_t.h
nff_bfs.o: /usr/include/sys/_types/_int64_t.h /usr/include/_types/_uint8_t.h
nff_bfs.o: /usr/include/_types/_uint16_t.h /usr/include/_types/_uint32_t.h
nff_bfs.o: /usr/include/_types/_uint64_t.h /usr/include/sys/_types.h
nff_bfs.o: /usr/include/sys/cdefs.h /usr/include/sys/_symbol_aliasing.h
nff_bfs.o: /usr/include/sys/_posix_availability.h
nff_bfs.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
nff_bfs.o: /usr/include/sys/_pthread/_pthread_types.h
nff_bfs.o: /usr/include/sys/_types/_intptr_t.h
nff_bfs.o: /usr/include/sys/_types/_uintptr_t.h
nff_bfs.o: /usr/include/_types/_intmax_t.h /usr/include/_types/_uintmax_t.h
nff_bfs.o: nff_state.hxx jenkins_12bit.hxx nff_h2.hxx ext_math.hxx
nff_bfs.o: pddl_fluent_table.hxx nff_hsa_best_supporter.hxx
nff_bfs.o: nff_pb_best_supporter.hxx nff_best_supporter.hxx
nff_bfs.o: nff_relaxed_plan.hxx nff_harp_adapter.hxx
nff_bfs.o: nff_heuristic_adapter.hxx nff_heuristic.hxx nff_rp_heuristic.hxx
nff_bfs.o: nff_helpful.hxx nff_options.hxx
