use AlgoClass::SecondLargest 'second_largest';
use Test::LectroTest;

Property {
##[ x <- List(Int(length => [2,])) ]##
    my @sorted = sort { <=> } @$x;
    my $result = second_largest(@$x);
    $result->{value} == @sorted[-2];
}, name => "second_largest returns the second largest element of the array"
