use strict;
use warnings;
package AlgoClass::SecondLargest;
use Exporter 'import';
our @EXPORT_OK = qw/second_largest go merge base_case trim_to_power_of_two
    naive_second_largest/;
use 5.010;

=pod

[Posted March 22nd] You are given as input an unsorted array of n distinct
numbers, where n is a power of 2. Give an algorithm that identifies the
second-largest number in the array, and that uses at most n + log_2(n) − 2
comparisons.

=cut

sub trim_to_power_of_two {
    my ($x) = @_;
    my $length = scalar @$x;
    my $n = int(log($length)/log(2));
    return [ @$x[0 .. 2**$n - 1] ];
}

# returns top two elements in descending order, number of comparisons
sub go {
    if (@_ < 2) {
        die "Not enough elements!";
    } elsif (@_ == 2) {
        return base_case(@_);
    } else {
        my $split = int($#_ / 2);
        my $left = go(@_[0 .. $split]);
        my $right = go(@_[$split + 1 .. $#_]);
        return merge($left, $right);
    }
}

sub merge {
    my ($left, $right) = @_;
    my $left_top  = $left->{top};
    my $right_top = $right->{top};
    my $comparisons = $left->{comparisons} + $right->{comparisons} + 1;
    my ($top, @losers);
    if ($left_top < $right_top) {
        $top = $right_top;
        @losers = ($left_top, @{$right->{losers}});
    } elsif ($left_top == $right_top) {
        die "Array contains duplicate elements";
    } else {
        $top = $left_top;
        @losers = ($right_top, @{$left->{losers}});
    }
    return { top => $top, losers => [@losers], comparisons => $comparisons };
}

sub base_case {
    if ($_[0] < $_[1]) {
        return { top => $_[1], losers => [$_[0]], comparisons => 1 }
    } else {
        return { top => $_[0], losers => [$_[1]], comparisons => 1 }
    }
}

# returns second largest element of @_, number of comparisons made.
sub second_largest {
    my $result = go(@_);
    my $second = shift @{$result->{losers}};
    for my $loser (@{$result->{losers}}) {
        if ($loser > $second) {
            $second = $loser;
        }
    }
    return { value => $second, comparisons => $result->{comparisons} };
}

sub naive_second_largest {
    my @array = @_;
    my @sorted = sort { $a <=> $b } @array;
    return $sorted[-2];
}
