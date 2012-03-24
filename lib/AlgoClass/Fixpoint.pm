use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw/fixpoint/;

# You are given a sorted (from smallest to largest) array A of n integers which
# can be positive, negative, or zero. You want to decide whether or not there
# is an index i such that A[i] = i. Design the fastest algorithm that you can
# for solving this problem.

sub fixpoint {
# idea: ($lower .. $upper) is a region which may contain a fixpoint.
    my $lower = 0;
    my $upper = $#_;
    while ($lower < $upper - 1) {
        if ($lower == $_[$lower]) {
            return $lower;
        } elsif ($upper == $_[$upper]) {
            return $upper;
        }
        my $middle = int(($lower + $upper)/2);
        if ($_[$middle] == $middle) {
            return $middle;
        } elsif ($_[$middle] < $middle) {
            $lower = $middle;
        } else {
            $upper = $middle;
        }
    }
    return undef;
}

