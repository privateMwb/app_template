# backend

C++ backend for this app. Built with CMake; any vendored
dependencies live as git submodules under `external/`.

`sample.h` / `main.cpp` are placeholders showing the expected
include/src split — replace them with real code and update the
sources list in `CMakeLists.txt` to match. See the root
`README.md` for the full repo layout.

## Building

Out-of-source build, from `backend/`:

```bash
cmake -B build -S .
cmake --build build
```

Never build in-source (`cmake -B . -S .`) — see the root
`.gitignore` notes on why, and what it explicitly guards against.

The resulting binary is `build/app_backend` by default (see
`CMakeLists.txt`). If you rename that target, also update
`BINARY_NAME` in `../Dockerfile` so the two stay in sync.

## Adding a dependency as a submodule

```bash
git submodule add <repo-url> external/<name>
```

Then uncomment and add an `add_subdirectory(external/<name>)`
line in `CMakeLists.txt`, and link it in `target_link_libraries`.
See the comments in `CMakeLists.txt` for the exact spots.

If CI or a container needs to build this without a full
`git submodule update --init --recursive` (e.g. a plain
`COPY . .` in a Dockerfile), see `../init-nested-submodules.sh`,
which handles cloning submodules-of-submodules from just the
tracked `.gitmodules` files.

## Formatting & linting

Config lives at the repo root: `.clang-format` and `.clang-tidy`
apply here. See the comments in `.clang-tidy` for which checks
are disabled and why — update that file as this project's real
conventions take shape.

## Generated docs

API reference docs are generated from `include/` and `src/` via
Doxygen — see `../docs/README.md`.
