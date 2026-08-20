# ============================================================
# CMakeLists.txt — backend
# ============================================================
#
# Top-level build file for backend/. Any git submodules vendored
# under external/ (see .gitmodules once you add one) get pulled
# in via add_subdirectory below.
#
# TODO when starting a new app from this template:
#   - Rename the project() call below.
#   - Rename the `app_backend` executable target if you want a
#     different binary name -- just keep it in sync with
#     BINARY_NAME in ../Dockerfile, since that's the name Docker
#     copies out of the build and runs.
#   - Replace src/main.cpp / include/sample.h with real code,
#     and update the sources list below to match.
# ============================================================

cmake_minimum_required(VERSION 3.20)

project(
    AppName
    VERSION 0.1.0
    LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

# ============================================================================
# Submodules (untouched, upstream -- see .gitmodules)
# ============================================================================

# A submodule vendored under external/ often exposes its own
# BUILD_TESTS / BUILD_BENCHMARKS / BUILD_EXAMPLES options,
# defaulting ON in its own CMakeLists.txt. Force them off here
# before add_subdirectory() picks up those defaults -- this repo
# only wants the library itself, not its test/benchmark/example
# suites.
set(BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(BUILD_BENCHMARKS OFF CACHE BOOL "" FORCE)
set(BUILD_REGRESSION OFF CACHE BOOL "" FORCE)
set(BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)

# TODO: uncomment and add one line per submodule once you've
# added it under external/ (see external/.gitkeep). Example:
# add_subdirectory(external/somelib)
#
# NOTE: if a submodule itself vendors independent copies of
# other shared libraries, and you add more than one submodule
# that vendors the *same* shared dependency, linking can fail
# with "multiple definition of ..." -- that's a submodule-level
# packaging issue, not something wrong with this file. Try
# building first; only chase that fix if the linker actually
# complains.

# ============================================================================
# Executable
# ============================================================================

# TODO: rename this target if you rename the binary -- keep it in
# sync with BINARY_NAME in ../Dockerfile.
add_executable(
    app_backend
    src/main.cpp
)

target_include_directories(
    app_backend
    PRIVATE
        include
        src
)

# TODO: link any submodules added above, e.g.:
# target_link_libraries(
#     app_backend
#     PRIVATE
#         SomeLib
# )