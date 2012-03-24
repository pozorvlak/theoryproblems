#!/usr/bin/perl

# You are given a sorted (from smallest to largest) array A of n integers which
# can be positive, negative, or zero. You want to decide whether or not there
# is an index i such that A[i] = i. Design the fastest algorithm that you can
# for solving this problem.

use Test::More;
use AlgoClass::Fixpoint 'fixpoint';

ok(!defined(fixpoint(-1, 0, 1, 2)), "Undef if no fixpoint exists");
is(fixpoint(-1, 0, 1, 2, 4, 6), 4, "Returns fixpoint if one exists");
is(fixpoint(0, 2..7), 0, "Fixpoint at beginning");
is(fixpoint(-1..7, 9), 9, "Fixpoint at end");

done_testing;
