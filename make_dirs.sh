#!/bin/bash -l

# create a directory and any necessary parent directories given the only argument passed to this script
rm -rf "$1" 2>/dev/null || true
mkdir -p "$1"
cp -r *.py "$1"
cp -r plan-greedy "$1"
cp -r pr "$1"
cp -r lama "$1"
cp -r hspf "$1"