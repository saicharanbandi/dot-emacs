# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/uic17457/.emacs.d/elpa/vterm-20240102.1640

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build

# Utility rule file for libvterm.

# Include the progress variables for this target.
include CMakeFiles/libvterm.dir/progress.make

CMakeFiles/libvterm: CMakeFiles/libvterm-complete


CMakeFiles/libvterm-complete: libvterm-prefix/src/libvterm-stamp/libvterm-install
CMakeFiles/libvterm-complete: libvterm-prefix/src/libvterm-stamp/libvterm-mkdir
CMakeFiles/libvterm-complete: libvterm-prefix/src/libvterm-stamp/libvterm-download
CMakeFiles/libvterm-complete: libvterm-prefix/src/libvterm-stamp/libvterm-update
CMakeFiles/libvterm-complete: libvterm-prefix/src/libvterm-stamp/libvterm-patch
CMakeFiles/libvterm-complete: libvterm-prefix/src/libvterm-stamp/libvterm-configure
CMakeFiles/libvterm-complete: libvterm-prefix/src/libvterm-stamp/libvterm-build
CMakeFiles/libvterm-complete: libvterm-prefix/src/libvterm-stamp/libvterm-install
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Completed 'libvterm'"
	/usr/bin/cmake -E make_directory /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/CMakeFiles
	/usr/bin/cmake -E touch /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/CMakeFiles/libvterm-complete
	/usr/bin/cmake -E touch /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/libvterm-prefix/src/libvterm-stamp/libvterm-done

libvterm-prefix/src/libvterm-stamp/libvterm-install: libvterm-prefix/src/libvterm-stamp/libvterm-build
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "No install step for 'libvterm'"
	cd /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/libvterm-prefix/src/libvterm && /usr/bin/cmake -E echo_append
	cd /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/libvterm-prefix/src/libvterm && /usr/bin/cmake -E touch /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/libvterm-prefix/src/libvterm-stamp/libvterm-install

libvterm-prefix/src/libvterm-stamp/libvterm-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Creating directories for 'libvterm'"
	/usr/bin/cmake -E make_directory /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/libvterm-prefix/src/libvterm
	/usr/bin/cmake -E make_directory /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/libvterm-prefix/src/libvterm
	/usr/bin/cmake -E make_directory /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/libvterm-prefix
	/usr/bin/cmake -E make_directory /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/libvterm-prefix/tmp
	/usr/bin/cmake -E make_directory /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/libvterm-prefix/src/libvterm-stamp
	/usr/bin/cmake -E make_directory /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/libvterm-prefix/src
	/usr/bin/cmake -E make_directory /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/libvterm-prefix/src/libvterm-stamp
	/usr/bin/cmake -E touch /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/libvterm-prefix/src/libvterm-stamp/libvterm-mkdir

libvterm-prefix/src/libvterm-stamp/libvterm-download: libvterm-prefix/src/libvterm-stamp/libvterm-gitinfo.txt
libvterm-prefix/src/libvterm-stamp/libvterm-download: libvterm-prefix/src/libvterm-stamp/libvterm-mkdir
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Performing download step (git clone) for 'libvterm'"
	cd /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/libvterm-prefix/src && /usr/bin/cmake -P /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/libvterm-prefix/tmp/libvterm-gitclone.cmake
	cd /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/libvterm-prefix/src && /usr/bin/cmake -E touch /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/libvterm-prefix/src/libvterm-stamp/libvterm-download

libvterm-prefix/src/libvterm-stamp/libvterm-update: libvterm-prefix/src/libvterm-stamp/libvterm-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Performing update step for 'libvterm'"
	cd /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/libvterm-prefix/src/libvterm && /usr/bin/cmake -P /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/libvterm-prefix/tmp/libvterm-gitupdate.cmake

libvterm-prefix/src/libvterm-stamp/libvterm-patch: libvterm-prefix/src/libvterm-stamp/libvterm-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "No patch step for 'libvterm'"
	/usr/bin/cmake -E echo_append
	/usr/bin/cmake -E touch /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/libvterm-prefix/src/libvterm-stamp/libvterm-patch

libvterm-prefix/src/libvterm-stamp/libvterm-configure: libvterm-prefix/tmp/libvterm-cfgcmd.txt
libvterm-prefix/src/libvterm-stamp/libvterm-configure: libvterm-prefix/src/libvterm-stamp/libvterm-update
libvterm-prefix/src/libvterm-stamp/libvterm-configure: libvterm-prefix/src/libvterm-stamp/libvterm-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "No configure step for 'libvterm'"
	cd /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/libvterm-prefix/src/libvterm && /usr/bin/cmake -E echo_append
	cd /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/libvterm-prefix/src/libvterm && /usr/bin/cmake -E touch /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/libvterm-prefix/src/libvterm-stamp/libvterm-configure

libvterm-prefix/src/libvterm-stamp/libvterm-build: libvterm-prefix/src/libvterm-stamp/libvterm-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Performing build step for 'libvterm'"
	cd /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/libvterm-prefix/src/libvterm && make "CFLAGS='-fPIC'" "LDFLAGS='-static'"
	cd /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/libvterm-prefix/src/libvterm && /usr/bin/cmake -E touch /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/libvterm-prefix/src/libvterm-stamp/libvterm-build

libvterm: CMakeFiles/libvterm
libvterm: CMakeFiles/libvterm-complete
libvterm: libvterm-prefix/src/libvterm-stamp/libvterm-install
libvterm: libvterm-prefix/src/libvterm-stamp/libvterm-mkdir
libvterm: libvterm-prefix/src/libvterm-stamp/libvterm-download
libvterm: libvterm-prefix/src/libvterm-stamp/libvterm-update
libvterm: libvterm-prefix/src/libvterm-stamp/libvterm-patch
libvterm: libvterm-prefix/src/libvterm-stamp/libvterm-configure
libvterm: libvterm-prefix/src/libvterm-stamp/libvterm-build
libvterm: CMakeFiles/libvterm.dir/build.make

.PHONY : libvterm

# Rule to build all files generated by this target.
CMakeFiles/libvterm.dir/build: libvterm

.PHONY : CMakeFiles/libvterm.dir/build

CMakeFiles/libvterm.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/libvterm.dir/cmake_clean.cmake
.PHONY : CMakeFiles/libvterm.dir/clean

CMakeFiles/libvterm.dir/depend:
	cd /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/uic17457/.emacs.d/elpa/vterm-20240102.1640 /home/uic17457/.emacs.d/elpa/vterm-20240102.1640 /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build /home/uic17457/.emacs.d/elpa/vterm-20240102.1640/build/CMakeFiles/libvterm.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/libvterm.dir/depend
