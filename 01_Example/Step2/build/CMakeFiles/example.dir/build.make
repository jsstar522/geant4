# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.14

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.14.5/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.14.5/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/jongseokpark/Desktop/infinite_learn/geant4/01_Example/Step2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/jongseokpark/Desktop/infinite_learn/geant4/01_Example/Step2/build

# Include any dependencies generated for this target.
include CMakeFiles/example.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/example.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/example.dir/flags.make

CMakeFiles/example.dir/example.cc.o: CMakeFiles/example.dir/flags.make
CMakeFiles/example.dir/example.cc.o: ../example.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jongseokpark/Desktop/infinite_learn/geant4/01_Example/Step2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/example.dir/example.cc.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/example.dir/example.cc.o -c /Users/jongseokpark/Desktop/infinite_learn/geant4/01_Example/Step2/example.cc

CMakeFiles/example.dir/example.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/example.dir/example.cc.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jongseokpark/Desktop/infinite_learn/geant4/01_Example/Step2/example.cc > CMakeFiles/example.dir/example.cc.i

CMakeFiles/example.dir/example.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/example.dir/example.cc.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jongseokpark/Desktop/infinite_learn/geant4/01_Example/Step2/example.cc -o CMakeFiles/example.dir/example.cc.s

CMakeFiles/example.dir/src/OTDetectorConstruction.cc.o: CMakeFiles/example.dir/flags.make
CMakeFiles/example.dir/src/OTDetectorConstruction.cc.o: ../src/OTDetectorConstruction.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jongseokpark/Desktop/infinite_learn/geant4/01_Example/Step2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/example.dir/src/OTDetectorConstruction.cc.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/example.dir/src/OTDetectorConstruction.cc.o -c /Users/jongseokpark/Desktop/infinite_learn/geant4/01_Example/Step2/src/OTDetectorConstruction.cc

CMakeFiles/example.dir/src/OTDetectorConstruction.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/example.dir/src/OTDetectorConstruction.cc.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jongseokpark/Desktop/infinite_learn/geant4/01_Example/Step2/src/OTDetectorConstruction.cc > CMakeFiles/example.dir/src/OTDetectorConstruction.cc.i

CMakeFiles/example.dir/src/OTDetectorConstruction.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/example.dir/src/OTDetectorConstruction.cc.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jongseokpark/Desktop/infinite_learn/geant4/01_Example/Step2/src/OTDetectorConstruction.cc -o CMakeFiles/example.dir/src/OTDetectorConstruction.cc.s

CMakeFiles/example.dir/src/OTPrimaryGeneratorAction.cc.o: CMakeFiles/example.dir/flags.make
CMakeFiles/example.dir/src/OTPrimaryGeneratorAction.cc.o: ../src/OTPrimaryGeneratorAction.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jongseokpark/Desktop/infinite_learn/geant4/01_Example/Step2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/example.dir/src/OTPrimaryGeneratorAction.cc.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/example.dir/src/OTPrimaryGeneratorAction.cc.o -c /Users/jongseokpark/Desktop/infinite_learn/geant4/01_Example/Step2/src/OTPrimaryGeneratorAction.cc

CMakeFiles/example.dir/src/OTPrimaryGeneratorAction.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/example.dir/src/OTPrimaryGeneratorAction.cc.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jongseokpark/Desktop/infinite_learn/geant4/01_Example/Step2/src/OTPrimaryGeneratorAction.cc > CMakeFiles/example.dir/src/OTPrimaryGeneratorAction.cc.i

CMakeFiles/example.dir/src/OTPrimaryGeneratorAction.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/example.dir/src/OTPrimaryGeneratorAction.cc.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jongseokpark/Desktop/infinite_learn/geant4/01_Example/Step2/src/OTPrimaryGeneratorAction.cc -o CMakeFiles/example.dir/src/OTPrimaryGeneratorAction.cc.s

CMakeFiles/example.dir/src/OTRunAction.cc.o: CMakeFiles/example.dir/flags.make
CMakeFiles/example.dir/src/OTRunAction.cc.o: ../src/OTRunAction.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jongseokpark/Desktop/infinite_learn/geant4/01_Example/Step2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/example.dir/src/OTRunAction.cc.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/example.dir/src/OTRunAction.cc.o -c /Users/jongseokpark/Desktop/infinite_learn/geant4/01_Example/Step2/src/OTRunAction.cc

CMakeFiles/example.dir/src/OTRunAction.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/example.dir/src/OTRunAction.cc.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jongseokpark/Desktop/infinite_learn/geant4/01_Example/Step2/src/OTRunAction.cc > CMakeFiles/example.dir/src/OTRunAction.cc.i

CMakeFiles/example.dir/src/OTRunAction.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/example.dir/src/OTRunAction.cc.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jongseokpark/Desktop/infinite_learn/geant4/01_Example/Step2/src/OTRunAction.cc -o CMakeFiles/example.dir/src/OTRunAction.cc.s

CMakeFiles/example.dir/src/OTSteppingAction.cc.o: CMakeFiles/example.dir/flags.make
CMakeFiles/example.dir/src/OTSteppingAction.cc.o: ../src/OTSteppingAction.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jongseokpark/Desktop/infinite_learn/geant4/01_Example/Step2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/example.dir/src/OTSteppingAction.cc.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/example.dir/src/OTSteppingAction.cc.o -c /Users/jongseokpark/Desktop/infinite_learn/geant4/01_Example/Step2/src/OTSteppingAction.cc

CMakeFiles/example.dir/src/OTSteppingAction.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/example.dir/src/OTSteppingAction.cc.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jongseokpark/Desktop/infinite_learn/geant4/01_Example/Step2/src/OTSteppingAction.cc > CMakeFiles/example.dir/src/OTSteppingAction.cc.i

CMakeFiles/example.dir/src/OTSteppingAction.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/example.dir/src/OTSteppingAction.cc.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jongseokpark/Desktop/infinite_learn/geant4/01_Example/Step2/src/OTSteppingAction.cc -o CMakeFiles/example.dir/src/OTSteppingAction.cc.s

# Object files for target example
example_OBJECTS = \
"CMakeFiles/example.dir/example.cc.o" \
"CMakeFiles/example.dir/src/OTDetectorConstruction.cc.o" \
"CMakeFiles/example.dir/src/OTPrimaryGeneratorAction.cc.o" \
"CMakeFiles/example.dir/src/OTRunAction.cc.o" \
"CMakeFiles/example.dir/src/OTSteppingAction.cc.o"

# External object files for target example
example_EXTERNAL_OBJECTS =

example: CMakeFiles/example.dir/example.cc.o
example: CMakeFiles/example.dir/src/OTDetectorConstruction.cc.o
example: CMakeFiles/example.dir/src/OTPrimaryGeneratorAction.cc.o
example: CMakeFiles/example.dir/src/OTRunAction.cc.o
example: CMakeFiles/example.dir/src/OTSteppingAction.cc.o
example: CMakeFiles/example.dir/build.make
example: /usr/local/Geant4/lib/libG4Tree.dylib
example: /usr/local/Geant4/lib/libG4GMocren.dylib
example: /usr/local/Geant4/lib/libG4visHepRep.dylib
example: /usr/local/Geant4/lib/libG4RayTracer.dylib
example: /usr/local/Geant4/lib/libG4VRML.dylib
example: /usr/local/Geant4/lib/libG4OpenGL.dylib
example: /usr/local/Geant4/lib/libG4gl2ps.dylib
example: /usr/local/Geant4/lib/libG4interfaces.dylib
example: /usr/local/Geant4/lib/libG4persistency.dylib
example: /usr/local/Geant4/lib/libG4error_propagation.dylib
example: /usr/local/Geant4/lib/libG4readout.dylib
example: /usr/local/Geant4/lib/libG4physicslists.dylib
example: /usr/local/Geant4/lib/libG4parmodels.dylib
example: /usr/local/Geant4/lib/libG4FR.dylib
example: /usr/local/Geant4/lib/libG4vis_management.dylib
example: /usr/local/Geant4/lib/libG4modeling.dylib
example: /usr/X11R6/lib/libGL.dylib
example: /usr/X11R6/lib/libGLU.dylib
example: /usr/X11R6/lib/libSM.dylib
example: /usr/X11R6/lib/libICE.dylib
example: /usr/X11R6/lib/libX11.dylib
example: /usr/X11R6/lib/libXext.dylib
example: /usr/X11R6/lib/libXmu.dylib
example: /usr/local/Geant4/lib/libG4run.dylib
example: /usr/local/Geant4/lib/libG4event.dylib
example: /usr/local/Geant4/lib/libG4tracking.dylib
example: /usr/local/Geant4/lib/libG4processes.dylib
example: /usr/local/Geant4/lib/libG4analysis.dylib
example: /usr/X11R6/lib/libfreetype.dylib
example: /usr/local/Geant4/lib/libG4zlib.dylib
example: /usr/lib/libexpat.dylib
example: /usr/local/Geant4/lib/libG4digits_hits.dylib
example: /usr/local/Geant4/lib/libG4track.dylib
example: /usr/local/Geant4/lib/libG4particles.dylib
example: /usr/local/Geant4/lib/libG4geometry.dylib
example: /usr/local/Geant4/lib/libG4materials.dylib
example: /usr/local/Geant4/lib/libG4graphics_reps.dylib
example: /usr/local/Geant4/lib/libG4intercoms.dylib
example: /usr/local/Geant4/lib/libG4global.dylib
example: /usr/local/lib/libCLHEP-2.4.1.2.dylib
example: CMakeFiles/example.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/jongseokpark/Desktop/infinite_learn/geant4/01_Example/Step2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX executable example"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/example.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/example.dir/build: example

.PHONY : CMakeFiles/example.dir/build

CMakeFiles/example.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/example.dir/cmake_clean.cmake
.PHONY : CMakeFiles/example.dir/clean

CMakeFiles/example.dir/depend:
	cd /Users/jongseokpark/Desktop/infinite_learn/geant4/01_Example/Step2/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/jongseokpark/Desktop/infinite_learn/geant4/01_Example/Step2 /Users/jongseokpark/Desktop/infinite_learn/geant4/01_Example/Step2 /Users/jongseokpark/Desktop/infinite_learn/geant4/01_Example/Step2/build /Users/jongseokpark/Desktop/infinite_learn/geant4/01_Example/Step2/build /Users/jongseokpark/Desktop/infinite_learn/geant4/01_Example/Step2/build/CMakeFiles/example.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/example.dir/depend

