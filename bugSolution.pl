Several approaches can ensure ordered iteration:

1. **Using `sort`:** This is good for simple cases.
```perl
my %hash = (
    'a' => 1,
    'b' => 2,
    'c' => 3
);

for my $key (sort keys %hash) {
    print "Key: $key, Value: $hash{$key}\n";
}
```

2. **Using `tied` hashes (for maintaining order):**
```perl
use Tie::IxHash;

tie my %hash, 'Tie::IxHash';
%hash = (
    'a' => 1,
    'b' => 2,
    'c' => 3
);

for my $key (keys %hash) {
    print "Key: $key, Value: $hash{$key}\n";
}
```

3. **Using an array of key-value pairs:** This is suitable if you need to control the order from the start.
```perl
my @data = (
    ['a', 1],
    ['b', 2],
    ['c', 3]
);

for my $pair (@data) {
    my ($key, $value) = @$pair;
    print "Key: $key, Value: $value\n";
}
```
Choose the method best fitting your needs and context.