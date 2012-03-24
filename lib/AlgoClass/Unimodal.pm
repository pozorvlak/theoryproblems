#!/usr/bin/perl

use strict;
use warnings;

package AlgoClass::Unimodal;
use Exporter 'import';
our @EXPORT_OK = qw/max_elt/;

sub max_elt {
    my $lower = 0;
    my $upper = $#_;
    while ($lower < $upper) {
        my $index = int(($lower + $upper) / 2);
        if ($_[$index] < $_[$index + 1]) {
            $lower = $index + 1;
        } else {
            $upper = $index;
        }
    }
    return $_[$lower];
}
