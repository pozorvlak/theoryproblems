use AlgoClass::SecondLargest qw(second_largest trim_to_power_of_two
    naive_second_largest);
use Test::LectroTest;

Property {
##[ x <- List(Int, length => [2,]) ]##
    $x = trim_to_power_of_two($x);
    my $result = second_largest(@$x);
    $result->{value} == naive_second_largest(@$x);
}, name => "second_largest returns the second largest element of the array";

Property {
##[ x <- List(Int, length => [2,]) ]##
    $x = trim_to_power_of_two($x);
    my $n = @$x;
    my $result = second_largest(@$x);
    $result->{comparisons} <= $n + log($n)/log(2) - 2;
}, name => "second_largest uses at most n + lg(n) - 2 comparisons";

