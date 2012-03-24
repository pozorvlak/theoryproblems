use Test::More;
use AlgoClass::SecondLargest qw/second_largest go merge base_case
    trim_to_power_of_two naive_second_largest/;
use 5.010;

is_deeply(trim_to_power_of_two([1..6]), [1,2,3,4], "trim 6->4");
is_deeply(trim_to_power_of_two([1..3]), [1,2], "trim 3->2");

is_deeply(merge({top_two => [5,3], comparisons => 7},
                {top_two => [4,1], comparisons => 9}),
          {top_two => [5,4], comparisons => 18}, "merge");

is_deeply(merge({top_two => [5,3], comparisons => 7},
                {top_two => [5,1], comparisons => 9}),
          {top_two => [5,5], comparisons => 18}, "merge");

is_deeply(merge({top_two => [5,5], comparisons => 7},
                {top_two => [4,1], comparisons => 9}),
          {top_two => [5,5], comparisons => 18}, "merge");

is_deeply(merge({top_two => [5,4], comparisons => 7},
                {top_two => [3,1], comparisons => 9}),
          {top_two => [5,4], comparisons => 18}, "merge");

is_deeply(base_case(-1,1), {top_two => [1,-1], comparisons => 1}, "base case");
is_deeply(base_case(1,-1), {top_two => [1,-1], comparisons => 1}, "base case");
is_deeply(go(0,1), {top_two => [1,0], comparisons => 1}, "go");
is_deeply(go(1,0), {top_two => [1,0], comparisons => 1}, "go");
is(naive_second_largest(0,1), 0, "naive second-largest");

# Example found by Test::LectroTest
$x = [ -1, 0, 1, 0, -1, 1, 0, -1, -1, -1, 0, -1, 1, 0, -1, 0, 1, 0, 0 ];
$x = trim_to_power_of_two($x);
is(naive_second_largest(@$x), 1, "Expected data is right");
$result = second_largest(@$x);
is($result->{value}, 1, "Example that it failed on");

done_testing;
