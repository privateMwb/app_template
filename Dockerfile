# syntax=docker/dockerfile:1

# ============================================================
# Backend build image
#
# Builds the CMake project in backend/. Nested git submodules
# under backend/external/ are cloned by init-nested-submodules.sh
# before configuring, since a plain `COPY . .` brings in tracked
# .gitmodules files but not the submodule contents themselves.
#
# TODO when starting a new app from this template:
#   - Set BINARY_NAME below to match your project's actual
#     executable target name (see backend/CMakeLists.txt).
# ============================================================

FROM ubuntu:24.04 AS build

RUN apt-get update && \
    apt-get install -y \
        build-essential \
        cmake \
        git \
        && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN chmod +x init-nested-submodules.sh && ./init-nested-submodules.sh

WORKDIR /app/backend

RUN cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTS=OFF \
    -DBUILD_BENCHMARKS=OFF \
    -DBUILD_REGRESSION=OFF \
    -DBUILD_EXAMPLES=OFF

RUN cmake --build build --config Release -j$(nproc)


FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install -y \
        libstdc++6 \
        && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# TODO: replace with your project's actual executable name,
# matching the target defined in backend/CMakeLists.txt.
# Declared as ARG + ENV (not ARG alone) because ARG values don't
# survive into the final image at container-run time -- only ENV
# does, which CMD's shell form below then reads.
ARG BINARY_NAME=app_backend
ENV BINARY_NAME=${BINARY_NAME}

COPY --from=build /app/backend/build/${BINARY_NAME} /app/${BINARY_NAME}

RUN mkdir -p /app/data

EXPOSE 8080

CMD ["sh", "-c", "/app/$BINARY_NAME"]