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
    my @left_two  = @{$left->{top_two}};
    my @right_two = @{$right->{top_two}};
    my @top_two;
    my $comparisons = $left->{comparisons} + $right->{comparisons};
    while (@top_two < 2) {
        if ($left_two[0] > $right_two[0]) {
            push @top_two, shift(@left_two);
        } else {
            push @top_two, shift(@right_two);
        }
        $comparisons++;
    }
    return { top_two => [@top_two], comparisons => $comparisons };
}

sub base_case {
    my $top_two = $_[0] < $_[1] ? [$_[1], $_[0]] : [$_[0], $_[1]];
    return { top_two => $top_two, comparisons => 1 }
}

# returns second largest element of @_, number of comparisons made.
sub second_largest {
    my $result = go(@_);
    return { value => $result->{top_two}[1],
             comparisons => $result->{comparisons} };
}

sub naive_second_largest {
    my @array = @_;
    my @sorted = sort { $a <=> $b } @array;
    return $sorted[-2];
}
