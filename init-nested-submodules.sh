#!/bin/bash
set -euo pipefail

# Some hosts/CI systems clone this repo's own submodules (e.g.
# backend/external/<lib>) automatically, but don't recurse into
# THAT submodule's own .gitmodules file if it has nested
# submodules of its own.
#
# This script finds every .gitmodules file in the tree -- at any
# depth -- and clones any submodule path that's still empty. It
# works without .git metadata, since .gitmodules is a plain
# tracked text file that survives a plain `COPY . .` even when
# the actual submodule contents don't.

find . -name ".gitmodules" | while read -r modfile; do
    dir=$(dirname "$modfile")
    echo "Found .gitmodules in: $dir"

    git config -f "$modfile" --get-regexp '\.path$' | while read -r key path; do
        name=$(echo "$key" | sed -E 's/^submodule\.(.*)\.path$/\1/')
        url=$(git config -f "$modfile" --get "submodule.$name.url")
        target="$dir/$path"

        if [ -z "$(ls -A "$target" 2>/dev/null || true)" ]; then
            echo "  Cloning missing submodule: $target <- $url"
            rm -rf "$target"
            git clone --depth 1 "$url" "$target"
        else
            echo "  Already present: $target"
        fi
    done
done