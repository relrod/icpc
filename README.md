# ICPC Templates and Notes [![Build Status](https://travis-ci.org/relrod/icpc.svg)](https://travis-ci.org/relrod/icpc)

For the ICPC Programming Competition, contestants are allowed to print out
notes and code before the competition.

This repository aims to collect a number of useful code samples for printing.

## Emacs

The ICPC environment includes emacs. The `.emacs` file in this repository
contains what I consider to be a useful starting point for competing in such a
competition using emacs. It is kept as short as possible so that typing it out
in a short time is possible.

## Test

`test/runner.sh` contains a small test suite to make sure the files compile and
work with basic functionality. They are not meant to be correctness tests, just
a quick sanity check. They work by comparing `sha512sum` output against a
known-good hash.

## License

Code in this repository is released under a 2-clause BSD license, with the
following addition:

USE OF THIS CODE DURING PROGRAMMING COMPETITIONS OF ANY KIND IS PERMITTED
WITHOUT ANY ATTRIBUTION.
