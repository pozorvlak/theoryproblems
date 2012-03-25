use AlgoClass::SecondLargest qw(second_largest trim_to_power_of_two
    naive_second_largest);
use Test::LectroTest;

Property {
##[ x <- Hash(Int, Int, length => [2,]) ]##
    $x = trim_to_power_of_two([keys %$x]);
    if (@$x >= 2) {
        my $result = second_largest(@$x);
        $result->{value} == naive_second_largest(@$x);
    } else {
        1;
    }
}, name => "second_largest returns the second largest element of the array";

Property {
##[ x <- Hash(Int, Int, length => [2,]) ]##
    $x = trim_to_power_of_two([keys %$x]);
    my $n = @$x;
    if ($n >= 2) {
        my $result = second_largest(@$x);
        $result->{comparisons} <= $n + log($n)/log(2) - 2;
    } else {
        1;
    }
}, name => "second_largest uses at most n + lg(n) - 2 comparisons";

