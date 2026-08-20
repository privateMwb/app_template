<!--
  Retargeting: replace every <angle-bracket> placeholder below. The
  badge URLs, CI workflow names, and project-structure tree already
  match this skeleton's actual layout — only the owner/repo and
  project name need swapping in those. Features is marked as a
  section to write fresh each time; don't invent content to fill it.
  Also edit the two <text> strings inside .github/assets/banner.svg
  (project name + tagline).

  Sections intentionally NOT included, and why:
    - Benchmarks — this is an app template, not a library; there's
      no reference implementation to measure against.
    - Installation via find_package/vcpkg/Conan — nothing here is
      meant to be consumed as a library dependency.
    - A #include Quick Start — replaced with actual run instructions
      below, since this scaffold produces a running app, not an API
      to call.
-->

<p align="center">
  <img src=".github/assets/banner.svg" alt="<ProjectName>" width="100%">
</p>

<p align="center">
  <img src="https://img.shields.io/github/v/release/<owner>/<repo>?style=for-the-badge&logo=github&color=6E40C9&labelColor=0D1117" alt="Version">
  <img src="https://img.shields.io/badge/License-MIT-39D0D8?style=for-the-badge&labelColor=0D1117" alt="License - MIT">
  <img src="https://img.shields.io/badge/C%2B%2B-23-00599C?style=for-the-badge&logo=c%2B%2B&labelColor=0D1117" alt="C++ - 23">
  <img src="https://img.shields.io/badge/React-Vite-61DAFB?style=for-the-badge&logo=react&labelColor=0D1117" alt="React - Vite">
</p>

<p align="center">
  <a href="https://github.com/<owner>/<repo>/actions/workflows/build.yml">
    <img src="https://github.com/<owner>/<repo>/actions/workflows/build.yml/badge.svg" alt="Build">
  </a>
  <a href="https://github.com/<owner>/<repo>/actions/workflows/frontend.yml">
    <img src="https://github.com/<owner>/<repo>/actions/workflows/frontend.yml/badge.svg" alt="Frontend">
  </a>
  <a href="https://github.com/<owner>/<repo>/actions/workflows/sanitizers.yml">
    <img src="https://github.com/<owner>/<repo>/actions/workflows/sanitizers.yml/badge.svg" alt="Sanitizers">
  </a>
  <a href="https://github.com/<owner>/<repo>/actions/workflows/clang-tidy.yml">
    <img src="https://github.com/<owner>/<repo>/actions/workflows/clang-tidy.yml/badge.svg" alt="Clang Tidy">
  </a>
  <a href="https://github.com/<owner>/<repo>/actions/workflows/clang-format.yml">
    <img src="https://github.com/<owner>/<repo>/actions/workflows/clang-format.yml/badge.svg" alt="Clang Format">
  </a>
  <a href="https://github.com/<owner>/<repo>/actions/workflows/docs.yml">
    <img src="https://github.com/<owner>/<repo>/actions/workflows/docs.yml/badge.svg" alt="Documentation">
  </a>
  <a href="https://github.com/<owner>/<repo>/actions/workflows/release.yml">
    <img src="https://github.com/<owner>/<repo>/actions/workflows/release.yml/badge.svg" alt="Release">
  </a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/GCC-support-B46F1B?style=flat&logo=gnu" alt="GCC - support">
  <img src="https://img.shields.io/badge/Clang-support-045891?style=flat&logo=llvm" alt="Clang - support">
</p>

<p align="center">
  <img src=".github/assets/divider.svg" alt="" width="100%">
</p>

<!-- One or two sentences: what this is, and the two or three things
     that make it worth using over starting from scratch. This is
     the only line most visitors read — make it specific, not
     generic marketing copy. -->
<p align="center"><ProjectName> is a <one-line description of what this app does and why>.</p>

<br>

## 📑 Table of Contents

- [Features](#features)
- [Requirements](#requirements)
- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [Development](#development)
- [Documentation](#documentation)
- [Deployment](#deployment)
- [Contributing](#contributing)
- [Changelog](#changelog)
- [License](#license)

<br>

## <a id="features"></a>✨ Features

<!-- Write these fresh per app — name the actual functionality this
     particular app has, not what the template scaffolds. A bullet
     that just describes the template ("has a CMake build", "has a
     Vite frontend") belongs in Project Structure, not here. -->

- **<Specific feature>** — <what it does and why it's built the way
  it is>.
- **<Another feature>** — <same pattern>.

<div align="right"><a href="#-table-of-contents"><img src=".github/assets/back-to-top.svg" alt="Back to top" height="28"></a></div>

## <a id="requirements"></a>📋 Requirements

- A C++23-conformant compiler (tested: GCC, Clang — see
  [backend/README.md](backend/README.md))
- CMake 3.20+
- Node.js 20+ and npm
- Docker, if building the backend image (optional for local dev)

<div align="right"><a href="#-table-of-contents"><img src=".github/assets/back-to-top.svg" alt="Back to top" height="28"></a></div>

## <a id="getting-started"></a>🚀 Getting Started

```bash
git clone https://github.com/<owner>/<repo>.git
cd <repo>
```

**Backend:**

```bash
cd backend
cmake -B build -S .
cmake --build build
./build/app_backend
```

**Frontend** (separate terminal):

```bash
cd frontend
npm install
cp .env.example .env.local   # set VITE_API_BASE_URL if the backend isn't on localhost:8080
npm run dev
```

See [backend/README.md](backend/README.md) and
[frontend/README.md](frontend/README.md) for details on either side.

<div align="right"><a href="#-table-of-contents"><img src=".github/assets/back-to-top.svg" alt="Back to top" height="28"></a></div>

## <a id="project-structure"></a>🗂️ Project Structure

<details>
<summary>Expand full tree</summary>

```
<repo>/
├── backend/
│   ├── data/                         # runtime data; gitignored except .gitkeep
│   ├── external/                     # vendored dependencies, as git submodules
│   ├── include/
│   ├── src/
│   ├── CMakeLists.txt
│   └── README.md
│
├── frontend/
│   ├── public/
│   ├── src/                          # components, pages, lib/ (api client, cn() helper)
│   ├── .env.example
│   ├── .gitignore
│   ├── .prettierignore
│   ├── .prettierrc.json
│   ├── eslint.config.js
│   ├── index.html
│   ├── package-lock.json
│   ├── package.json
│   ├── tsconfig.app.json
│   ├── tsconfig.json
│   ├── tsconfig.node.json
│   ├── vite.config.ts
│   └── README.md
│
├── docs/
│   ├── assets/                       # diagrams/screenshots for docs
│   ├── Doxyfile
│   └── README.md
│
├── .github/
│   ├── assets/                       # banner, divider, back-to-top for README
│   ├── releases/
│   ├── workflows/                    # build, lint, sanitizers, docs, release, CodeQL
│   └── dependabot.yml
│
├── .clang-format
├── .clang-tidy
├── .gitignore
├── Dockerfile
├── init-nested-submodules.sh
├── LICENSE
└── README.md
```

</details>

<div align="right"><a href="#-table-of-contents"><img src=".github/assets/back-to-top.svg" alt="Back to top" height="28"></a></div>

## <a id="development"></a>🛠️ Development

**Formatting & linting (backend):** `.clang-format` / `.clang-tidy`
live at the repo root — see the comments in `.clang-tidy` for which
checks are disabled and why.

**Formatting & linting (frontend):**

```bash
cd frontend
npm run lint
npm run format:check
```

**Sanitizers:** boot the backend under AddressSanitizer+UBSan or
ThreadSanitizer — see `.github/workflows/sanitizers.yml`, and its
`TODO`s for wiring in real endpoint checks once the app has real
handlers.

<div align="right"><a href="#-table-of-contents"><img src=".github/assets/back-to-top.svg" alt="Back to top" height="28"></a></div>

## <a id="documentation"></a>📖 Documentation

Full API reference for the backend, generated with Doxygen from
`docs/Doxyfile`:

**https://<owner>.github.io/<repo>/**

<div align="right"><a href="#-table-of-contents"><img src=".github/assets/back-to-top.svg" alt="Back to top" height="28"></a></div>

## <a id="deployment"></a>☁️ Deployment

**Backend:** builds via the repo's `Dockerfile` — multi-stage
`ubuntu:24.04` build, parameterized by `BINARY_NAME` (see the
comments in `Dockerfile`). `init-nested-submodules.sh` runs first
to clone any submodules-of-submodules a host's own automatic
submodule init doesn't recurse into.

```bash
docker build -t <repo>-backend .
docker run -p 8080:8080 <repo>-backend
```

**Frontend:** a static Vite build (`npm run build` → `frontend/dist/`),
deployable to any static host. Set `VITE_API_BASE_URL` to the
backend's deployed URL at build time or via the host's environment
variables.

No specific host is wired up in this template — pick per app based
on what it needs (a persistent volume for `backend/data/`, a
managed database instead, etc.).

<div align="right"><a href="#-table-of-contents"><img src=".github/assets/back-to-top.svg" alt="Back to top" height="28"></a></div>

## <a id="contributing"></a>🤝 Contributing

Issues and pull requests are welcome. Before submitting a PR:

- Run `clang-format`/`clang-tidy` on any changed backend files
- Run `npm run lint` and `npm run format:check` on any changed
  frontend files
- Make sure `docker build .` still succeeds if you touched the
  backend or `Dockerfile`

<div align="right"><a href="#-table-of-contents"><img src=".github/assets/back-to-top.svg" alt="Back to top" height="28"></a></div>

## <a id="changelog"></a>📝 Changelog

See the [Releases](https://github.com/<owner>/<repo>/releases)
page for version history and release notes.

## <a id="license"></a>📄 License

MIT — see [LICENSE](LICENSE) for details.

<p align="center">
  <sub>Built with C++23 &amp; React</sub>
</p>

<p align="center">
  <a href="#-table-of-contents"><img src=".github/assets/back-to-top.svg" alt="Back to top" height="28"></a>
</p>
