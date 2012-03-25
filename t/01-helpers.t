use Test::More;
use Test::Fatal;
use AlgoClass::SecondLargest qw/second_largest go merge base_case
    trim_to_power_of_two naive_second_largest/;
use 5.010;

is_deeply(trim_to_power_of_two([1..6]), [1,2,3,4], "trim 6->4");
is_deeply(trim_to_power_of_two([1..3]), [1,2], "trim 3->2");

is_deeply(merge({top => 5, losers => [3,4], comparisons => 7},
                {top => 4, losers => [2,1], comparisons => 9}),
          {top => 5, losers => [4,3,4], comparisons => 17}, "merge");

is_deeply(merge({top => 4, losers => [2,1], comparisons => 9},
                {top => 5, losers => [3,4], comparisons => 7}),
          {top => 5, losers => [4,3,4], comparisons => 17}, "merge");

like(
    exception {
        merge({top => 5, losers => [3,4], comparisons => 7},
              {top => 5, losers => [4,2], comparisons => 9}),
    }, 
    qr/Array contains duplicate elements/,
    "Exception thrown if the array contains non-distinct elements",
);

is_deeply(base_case(-1,1), {top => 1, losers => [-1], comparisons => 1},
          "base case");
is_deeply(base_case(1,-1), {top => 1, losers => [-1], comparisons => 1},
          "base case");
is_deeply(go(0,1), {top => 1, losers => [0], comparisons => 1}, "go");
is_deeply(go(1,0), {top => 1, losers => [0], comparisons => 1}, "go");
is(naive_second_largest(0,1), 0, "naive second-largest");

done_testing;
