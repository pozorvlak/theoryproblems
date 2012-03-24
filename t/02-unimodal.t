#!/usr/bin/perl

use Test::More;
use AlgoClass::Unimodal 'max_elt';

is(max_elt(qw/0 1 2 3 4 5 4 3 2 1/), 5, "Simple case");
is(max_elt(qw/5 4 3 2 1/), 5, "Max at beginning");
is(max_elt(qw/1 2 3 4 5 6/), 6, "Max at end");

done_testing;
