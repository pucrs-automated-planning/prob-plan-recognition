#!/bin/bash
#
# Build the observation compiler (pr2plan) on Linux or macOS.
#
# The FF sources bundled under mod-metric-ff/ are legacy C from 2010. Apple
# clang rejects them, so on macOS we build with a Homebrew GNU gcc/g++. On
# Linux the system gcc/g++ is already GNU and works out of the box. You can
# override the compiler by exporting CC and CXX before running this script.
#
set -e
cd "$(dirname "$0")"

if [ -z "$CC" ] || [ -z "$CXX" ]; then
    if [ "$(uname -s)" = "Darwin" ]; then
        # Pick the newest Homebrew GNU compiler (e.g. gcc-16).
        CC=${CC:-$(ls /opt/homebrew/bin/gcc-[0-9]* /usr/local/bin/gcc-[0-9]* 2>/dev/null | sort -V | tail -1)}
        CXX=${CXX:-$(ls /opt/homebrew/bin/g++-[0-9]* /usr/local/bin/g++-[0-9]* 2>/dev/null | sort -V | tail -1)}
        if [ -z "$CC" ] || [ -z "$CXX" ]; then
            echo "error: this build needs a Homebrew GNU gcc on macOS;" >&2
            echo "       Apple clang cannot compile the bundled FF sources." >&2
            echo "       Install one with:  brew install gcc" >&2
            exit 1
        fi
    else
        CC=${CC:-gcc}
        CXX=${CXX:-g++}
    fi
fi

echo "Building libff with CC=$CC"
( cd mod-metric-ff && make clean && make libff CC="$CC" )

echo "Building pr2plan with CC=$CXX"
make clean && make CC="$CXX"

echo "Done: $(pwd)/pr2plan"
