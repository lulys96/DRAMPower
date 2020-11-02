# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Default target executed when no arguments are given to make.
default_target: all

.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/luiza/Hiwi/DRAMPower

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/luiza/Hiwi/DRAMPower

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/usr/bin/cmake -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache

.PHONY : rebuild_cache/fast

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "No interactive CMake dialog available..."
	/usr/bin/cmake -E echo No\ interactive\ CMake\ dialog\ available.
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache

.PHONY : edit_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /home/luiza/Hiwi/DRAMPower/CMakeFiles /home/luiza/Hiwi/DRAMPower/CMakeFiles/progress.marks
	$(MAKE) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /home/luiza/Hiwi/DRAMPower/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean

.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named DRAMPowerCli

# Build rule for target.
DRAMPowerCli: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 DRAMPowerCli
.PHONY : DRAMPowerCli

# fast build rule for target.
DRAMPowerCli/fast:
	$(MAKE) -f CMakeFiles/DRAMPowerCli.dir/build.make CMakeFiles/DRAMPowerCli.dir/build
.PHONY : DRAMPowerCli/fast

#=============================================================================
# Target rules for targets named DRAMPower

# Build rule for target.
DRAMPower: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 DRAMPower
.PHONY : DRAMPower

# fast build rule for target.
DRAMPower/fast:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/build
.PHONY : DRAMPower/fast

src/MemCommand.o: src/MemCommand.cc.o

.PHONY : src/MemCommand.o

# target to build an object file
src/MemCommand.cc.o:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/MemCommand.cc.o
.PHONY : src/MemCommand.cc.o

src/MemCommand.i: src/MemCommand.cc.i

.PHONY : src/MemCommand.i

# target to preprocess a source file
src/MemCommand.cc.i:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/MemCommand.cc.i
.PHONY : src/MemCommand.cc.i

src/MemCommand.s: src/MemCommand.cc.s

.PHONY : src/MemCommand.s

# target to generate assembly for a file
src/MemCommand.cc.s:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/MemCommand.cc.s
.PHONY : src/MemCommand.cc.s

src/TraceParser.o: src/TraceParser.cc.o

.PHONY : src/TraceParser.o

# target to build an object file
src/TraceParser.cc.o:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/TraceParser.cc.o
.PHONY : src/TraceParser.cc.o

src/TraceParser.i: src/TraceParser.cc.i

.PHONY : src/TraceParser.i

# target to preprocess a source file
src/TraceParser.cc.i:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/TraceParser.cc.i
.PHONY : src/TraceParser.cc.i

src/TraceParser.s: src/TraceParser.cc.s

.PHONY : src/TraceParser.s

# target to generate assembly for a file
src/TraceParser.cc.s:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/TraceParser.cc.s
.PHONY : src/TraceParser.cc.s

src/cli/CliHandler.o: src/cli/CliHandler.cc.o

.PHONY : src/cli/CliHandler.o

# target to build an object file
src/cli/CliHandler.cc.o:
	$(MAKE) -f CMakeFiles/DRAMPowerCli.dir/build.make CMakeFiles/DRAMPowerCli.dir/src/cli/CliHandler.cc.o
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/cli/CliHandler.cc.o
.PHONY : src/cli/CliHandler.cc.o

src/cli/CliHandler.i: src/cli/CliHandler.cc.i

.PHONY : src/cli/CliHandler.i

# target to preprocess a source file
src/cli/CliHandler.cc.i:
	$(MAKE) -f CMakeFiles/DRAMPowerCli.dir/build.make CMakeFiles/DRAMPowerCli.dir/src/cli/CliHandler.cc.i
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/cli/CliHandler.cc.i
.PHONY : src/cli/CliHandler.cc.i

src/cli/CliHandler.s: src/cli/CliHandler.cc.s

.PHONY : src/cli/CliHandler.s

# target to generate assembly for a file
src/cli/CliHandler.cc.s:
	$(MAKE) -f CMakeFiles/DRAMPowerCli.dir/build.make CMakeFiles/DRAMPowerCli.dir/src/cli/CliHandler.cc.s
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/cli/CliHandler.cc.s
.PHONY : src/cli/CliHandler.cc.s

src/cli/drampower.o: src/cli/drampower.cc.o

.PHONY : src/cli/drampower.o

# target to build an object file
src/cli/drampower.cc.o:
	$(MAKE) -f CMakeFiles/DRAMPowerCli.dir/build.make CMakeFiles/DRAMPowerCli.dir/src/cli/drampower.cc.o
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/cli/drampower.cc.o
.PHONY : src/cli/drampower.cc.o

src/cli/drampower.i: src/cli/drampower.cc.i

.PHONY : src/cli/drampower.i

# target to preprocess a source file
src/cli/drampower.cc.i:
	$(MAKE) -f CMakeFiles/DRAMPowerCli.dir/build.make CMakeFiles/DRAMPowerCli.dir/src/cli/drampower.cc.i
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/cli/drampower.cc.i
.PHONY : src/cli/drampower.cc.i

src/cli/drampower.s: src/cli/drampower.cc.s

.PHONY : src/cli/drampower.s

# target to generate assembly for a file
src/cli/drampower.cc.s:
	$(MAKE) -f CMakeFiles/DRAMPowerCli.dir/build.make CMakeFiles/DRAMPowerCli.dir/src/cli/drampower.cc.s
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/cli/drampower.cc.s
.PHONY : src/cli/drampower.cc.s

src/common/DebugManager.o: src/common/DebugManager.cc.o

.PHONY : src/common/DebugManager.o

# target to build an object file
src/common/DebugManager.cc.o:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/common/DebugManager.cc.o
.PHONY : src/common/DebugManager.cc.o

src/common/DebugManager.i: src/common/DebugManager.cc.i

.PHONY : src/common/DebugManager.i

# target to preprocess a source file
src/common/DebugManager.cc.i:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/common/DebugManager.cc.i
.PHONY : src/common/DebugManager.cc.i

src/common/DebugManager.s: src/common/DebugManager.cc.s

.PHONY : src/common/DebugManager.s

# target to generate assembly for a file
src/common/DebugManager.cc.s:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/common/DebugManager.cc.s
.PHONY : src/common/DebugManager.cc.s

src/counters/Counters.o: src/counters/Counters.cc.o

.PHONY : src/counters/Counters.o

# target to build an object file
src/counters/Counters.cc.o:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/counters/Counters.cc.o
.PHONY : src/counters/Counters.cc.o

src/counters/Counters.i: src/counters/Counters.cc.i

.PHONY : src/counters/Counters.i

# target to preprocess a source file
src/counters/Counters.cc.i:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/counters/Counters.cc.i
.PHONY : src/counters/Counters.cc.i

src/counters/Counters.s: src/counters/Counters.cc.s

.PHONY : src/counters/Counters.s

# target to generate assembly for a file
src/counters/Counters.cc.s:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/counters/Counters.cc.s
.PHONY : src/counters/Counters.cc.s

src/counters/CountersDDR3.o: src/counters/CountersDDR3.cc.o

.PHONY : src/counters/CountersDDR3.o

# target to build an object file
src/counters/CountersDDR3.cc.o:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/counters/CountersDDR3.cc.o
.PHONY : src/counters/CountersDDR3.cc.o

src/counters/CountersDDR3.i: src/counters/CountersDDR3.cc.i

.PHONY : src/counters/CountersDDR3.i

# target to preprocess a source file
src/counters/CountersDDR3.cc.i:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/counters/CountersDDR3.cc.i
.PHONY : src/counters/CountersDDR3.cc.i

src/counters/CountersDDR3.s: src/counters/CountersDDR3.cc.s

.PHONY : src/counters/CountersDDR3.s

# target to generate assembly for a file
src/counters/CountersDDR3.cc.s:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/counters/CountersDDR3.cc.s
.PHONY : src/counters/CountersDDR3.cc.s

src/counters/CountersDDR4.o: src/counters/CountersDDR4.cc.o

.PHONY : src/counters/CountersDDR4.o

# target to build an object file
src/counters/CountersDDR4.cc.o:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/counters/CountersDDR4.cc.o
.PHONY : src/counters/CountersDDR4.cc.o

src/counters/CountersDDR4.i: src/counters/CountersDDR4.cc.i

.PHONY : src/counters/CountersDDR4.i

# target to preprocess a source file
src/counters/CountersDDR4.cc.i:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/counters/CountersDDR4.cc.i
.PHONY : src/counters/CountersDDR4.cc.i

src/counters/CountersDDR4.s: src/counters/CountersDDR4.cc.s

.PHONY : src/counters/CountersDDR4.s

# target to generate assembly for a file
src/counters/CountersDDR4.cc.s:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/counters/CountersDDR4.cc.s
.PHONY : src/counters/CountersDDR4.cc.s

src/counters/CountersWideIO.o: src/counters/CountersWideIO.cc.o

.PHONY : src/counters/CountersWideIO.o

# target to build an object file
src/counters/CountersWideIO.cc.o:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/counters/CountersWideIO.cc.o
.PHONY : src/counters/CountersWideIO.cc.o

src/counters/CountersWideIO.i: src/counters/CountersWideIO.cc.i

.PHONY : src/counters/CountersWideIO.i

# target to preprocess a source file
src/counters/CountersWideIO.cc.i:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/counters/CountersWideIO.cc.i
.PHONY : src/counters/CountersWideIO.cc.i

src/counters/CountersWideIO.s: src/counters/CountersWideIO.cc.s

.PHONY : src/counters/CountersWideIO.s

# target to generate assembly for a file
src/counters/CountersWideIO.cc.s:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/counters/CountersWideIO.cc.s
.PHONY : src/counters/CountersWideIO.cc.s

src/dramtypes/DRAMPowerDDR3.o: src/dramtypes/DRAMPowerDDR3.cc.o

.PHONY : src/dramtypes/DRAMPowerDDR3.o

# target to build an object file
src/dramtypes/DRAMPowerDDR3.cc.o:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/dramtypes/DRAMPowerDDR3.cc.o
.PHONY : src/dramtypes/DRAMPowerDDR3.cc.o

src/dramtypes/DRAMPowerDDR3.i: src/dramtypes/DRAMPowerDDR3.cc.i

.PHONY : src/dramtypes/DRAMPowerDDR3.i

# target to preprocess a source file
src/dramtypes/DRAMPowerDDR3.cc.i:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/dramtypes/DRAMPowerDDR3.cc.i
.PHONY : src/dramtypes/DRAMPowerDDR3.cc.i

src/dramtypes/DRAMPowerDDR3.s: src/dramtypes/DRAMPowerDDR3.cc.s

.PHONY : src/dramtypes/DRAMPowerDDR3.s

# target to generate assembly for a file
src/dramtypes/DRAMPowerDDR3.cc.s:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/dramtypes/DRAMPowerDDR3.cc.s
.PHONY : src/dramtypes/DRAMPowerDDR3.cc.s

src/dramtypes/DRAMPowerDDR4.o: src/dramtypes/DRAMPowerDDR4.cc.o

.PHONY : src/dramtypes/DRAMPowerDDR4.o

# target to build an object file
src/dramtypes/DRAMPowerDDR4.cc.o:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/dramtypes/DRAMPowerDDR4.cc.o
.PHONY : src/dramtypes/DRAMPowerDDR4.cc.o

src/dramtypes/DRAMPowerDDR4.i: src/dramtypes/DRAMPowerDDR4.cc.i

.PHONY : src/dramtypes/DRAMPowerDDR4.i

# target to preprocess a source file
src/dramtypes/DRAMPowerDDR4.cc.i:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/dramtypes/DRAMPowerDDR4.cc.i
.PHONY : src/dramtypes/DRAMPowerDDR4.cc.i

src/dramtypes/DRAMPowerDDR4.s: src/dramtypes/DRAMPowerDDR4.cc.s

.PHONY : src/dramtypes/DRAMPowerDDR4.s

# target to generate assembly for a file
src/dramtypes/DRAMPowerDDR4.cc.s:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/dramtypes/DRAMPowerDDR4.cc.s
.PHONY : src/dramtypes/DRAMPowerDDR4.cc.s

src/dramtypes/DRAMPowerIF.o: src/dramtypes/DRAMPowerIF.cc.o

.PHONY : src/dramtypes/DRAMPowerIF.o

# target to build an object file
src/dramtypes/DRAMPowerIF.cc.o:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/dramtypes/DRAMPowerIF.cc.o
.PHONY : src/dramtypes/DRAMPowerIF.cc.o

src/dramtypes/DRAMPowerIF.i: src/dramtypes/DRAMPowerIF.cc.i

.PHONY : src/dramtypes/DRAMPowerIF.i

# target to preprocess a source file
src/dramtypes/DRAMPowerIF.cc.i:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/dramtypes/DRAMPowerIF.cc.i
.PHONY : src/dramtypes/DRAMPowerIF.cc.i

src/dramtypes/DRAMPowerIF.s: src/dramtypes/DRAMPowerIF.cc.s

.PHONY : src/dramtypes/DRAMPowerIF.s

# target to generate assembly for a file
src/dramtypes/DRAMPowerIF.cc.s:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/dramtypes/DRAMPowerIF.cc.s
.PHONY : src/dramtypes/DRAMPowerIF.cc.s

src/dramtypes/DRAMPowerWideIO.o: src/dramtypes/DRAMPowerWideIO.cc.o

.PHONY : src/dramtypes/DRAMPowerWideIO.o

# target to build an object file
src/dramtypes/DRAMPowerWideIO.cc.o:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/dramtypes/DRAMPowerWideIO.cc.o
.PHONY : src/dramtypes/DRAMPowerWideIO.cc.o

src/dramtypes/DRAMPowerWideIO.i: src/dramtypes/DRAMPowerWideIO.cc.i

.PHONY : src/dramtypes/DRAMPowerWideIO.i

# target to preprocess a source file
src/dramtypes/DRAMPowerWideIO.cc.i:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/dramtypes/DRAMPowerWideIO.cc.i
.PHONY : src/dramtypes/DRAMPowerWideIO.cc.i

src/dramtypes/DRAMPowerWideIO.s: src/dramtypes/DRAMPowerWideIO.cc.s

.PHONY : src/dramtypes/DRAMPowerWideIO.s

# target to generate assembly for a file
src/dramtypes/DRAMPowerWideIO.cc.s:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/dramtypes/DRAMPowerWideIO.cc.s
.PHONY : src/dramtypes/DRAMPowerWideIO.cc.s

src/memspec/MemSpec.o: src/memspec/MemSpec.cc.o

.PHONY : src/memspec/MemSpec.o

# target to build an object file
src/memspec/MemSpec.cc.o:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/memspec/MemSpec.cc.o
.PHONY : src/memspec/MemSpec.cc.o

src/memspec/MemSpec.i: src/memspec/MemSpec.cc.i

.PHONY : src/memspec/MemSpec.i

# target to preprocess a source file
src/memspec/MemSpec.cc.i:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/memspec/MemSpec.cc.i
.PHONY : src/memspec/MemSpec.cc.i

src/memspec/MemSpec.s: src/memspec/MemSpec.cc.s

.PHONY : src/memspec/MemSpec.s

# target to generate assembly for a file
src/memspec/MemSpec.cc.s:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/memspec/MemSpec.cc.s
.PHONY : src/memspec/MemSpec.cc.s

src/memspec/MemSpecDDR3.o: src/memspec/MemSpecDDR3.cc.o

.PHONY : src/memspec/MemSpecDDR3.o

# target to build an object file
src/memspec/MemSpecDDR3.cc.o:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/memspec/MemSpecDDR3.cc.o
.PHONY : src/memspec/MemSpecDDR3.cc.o

src/memspec/MemSpecDDR3.i: src/memspec/MemSpecDDR3.cc.i

.PHONY : src/memspec/MemSpecDDR3.i

# target to preprocess a source file
src/memspec/MemSpecDDR3.cc.i:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/memspec/MemSpecDDR3.cc.i
.PHONY : src/memspec/MemSpecDDR3.cc.i

src/memspec/MemSpecDDR3.s: src/memspec/MemSpecDDR3.cc.s

.PHONY : src/memspec/MemSpecDDR3.s

# target to generate assembly for a file
src/memspec/MemSpecDDR3.cc.s:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/memspec/MemSpecDDR3.cc.s
.PHONY : src/memspec/MemSpecDDR3.cc.s

src/memspec/MemSpecDDR4.o: src/memspec/MemSpecDDR4.cc.o

.PHONY : src/memspec/MemSpecDDR4.o

# target to build an object file
src/memspec/MemSpecDDR4.cc.o:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/memspec/MemSpecDDR4.cc.o
.PHONY : src/memspec/MemSpecDDR4.cc.o

src/memspec/MemSpecDDR4.i: src/memspec/MemSpecDDR4.cc.i

.PHONY : src/memspec/MemSpecDDR4.i

# target to preprocess a source file
src/memspec/MemSpecDDR4.cc.i:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/memspec/MemSpecDDR4.cc.i
.PHONY : src/memspec/MemSpecDDR4.cc.i

src/memspec/MemSpecDDR4.s: src/memspec/MemSpecDDR4.cc.s

.PHONY : src/memspec/MemSpecDDR4.s

# target to generate assembly for a file
src/memspec/MemSpecDDR4.cc.s:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/memspec/MemSpecDDR4.cc.s
.PHONY : src/memspec/MemSpecDDR4.cc.s

src/memspec/MemSpecWideIO.o: src/memspec/MemSpecWideIO.cc.o

.PHONY : src/memspec/MemSpecWideIO.o

# target to build an object file
src/memspec/MemSpecWideIO.cc.o:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/memspec/MemSpecWideIO.cc.o
.PHONY : src/memspec/MemSpecWideIO.cc.o

src/memspec/MemSpecWideIO.i: src/memspec/MemSpecWideIO.cc.i

.PHONY : src/memspec/MemSpecWideIO.i

# target to preprocess a source file
src/memspec/MemSpecWideIO.cc.i:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/memspec/MemSpecWideIO.cc.i
.PHONY : src/memspec/MemSpecWideIO.cc.i

src/memspec/MemSpecWideIO.s: src/memspec/MemSpecWideIO.cc.s

.PHONY : src/memspec/MemSpecWideIO.s

# target to generate assembly for a file
src/memspec/MemSpecWideIO.cc.s:
	$(MAKE) -f CMakeFiles/DRAMPower.dir/build.make CMakeFiles/DRAMPower.dir/src/memspec/MemSpecWideIO.cc.s
.PHONY : src/memspec/MemSpecWideIO.cc.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... rebuild_cache"
	@echo "... edit_cache"
	@echo "... DRAMPowerCli"
	@echo "... DRAMPower"
	@echo "... src/MemCommand.o"
	@echo "... src/MemCommand.i"
	@echo "... src/MemCommand.s"
	@echo "... src/TraceParser.o"
	@echo "... src/TraceParser.i"
	@echo "... src/TraceParser.s"
	@echo "... src/cli/CliHandler.o"
	@echo "... src/cli/CliHandler.i"
	@echo "... src/cli/CliHandler.s"
	@echo "... src/cli/drampower.o"
	@echo "... src/cli/drampower.i"
	@echo "... src/cli/drampower.s"
	@echo "... src/common/DebugManager.o"
	@echo "... src/common/DebugManager.i"
	@echo "... src/common/DebugManager.s"
	@echo "... src/counters/Counters.o"
	@echo "... src/counters/Counters.i"
	@echo "... src/counters/Counters.s"
	@echo "... src/counters/CountersDDR3.o"
	@echo "... src/counters/CountersDDR3.i"
	@echo "... src/counters/CountersDDR3.s"
	@echo "... src/counters/CountersDDR4.o"
	@echo "... src/counters/CountersDDR4.i"
	@echo "... src/counters/CountersDDR4.s"
	@echo "... src/counters/CountersWideIO.o"
	@echo "... src/counters/CountersWideIO.i"
	@echo "... src/counters/CountersWideIO.s"
	@echo "... src/dramtypes/DRAMPowerDDR3.o"
	@echo "... src/dramtypes/DRAMPowerDDR3.i"
	@echo "... src/dramtypes/DRAMPowerDDR3.s"
	@echo "... src/dramtypes/DRAMPowerDDR4.o"
	@echo "... src/dramtypes/DRAMPowerDDR4.i"
	@echo "... src/dramtypes/DRAMPowerDDR4.s"
	@echo "... src/dramtypes/DRAMPowerIF.o"
	@echo "... src/dramtypes/DRAMPowerIF.i"
	@echo "... src/dramtypes/DRAMPowerIF.s"
	@echo "... src/dramtypes/DRAMPowerWideIO.o"
	@echo "... src/dramtypes/DRAMPowerWideIO.i"
	@echo "... src/dramtypes/DRAMPowerWideIO.s"
	@echo "... src/memspec/MemSpec.o"
	@echo "... src/memspec/MemSpec.i"
	@echo "... src/memspec/MemSpec.s"
	@echo "... src/memspec/MemSpecDDR3.o"
	@echo "... src/memspec/MemSpecDDR3.i"
	@echo "... src/memspec/MemSpecDDR3.s"
	@echo "... src/memspec/MemSpecDDR4.o"
	@echo "... src/memspec/MemSpecDDR4.i"
	@echo "... src/memspec/MemSpecDDR4.s"
	@echo "... src/memspec/MemSpecWideIO.o"
	@echo "... src/memspec/MemSpecWideIO.i"
	@echo "... src/memspec/MemSpecWideIO.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

