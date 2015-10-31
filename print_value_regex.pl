#!/usr/bin/perl 

use warnings;
use strict;

my $var = "BB00001XXXX XXXX XXXX STRING OG TEST AND MORE      METRO LINHA    123456/000009S";

# $var =~ qr/^\w{7}(\w{67})/;
$var =~ qr/^\w{7}(.{67})/;

print $1 . "\n";

$var    = "CC00002119666666801136666666619999996877777786040000                      00014N";

# $var =~/^\w{7}(\w{67})/;
$var =~/^\w{7}(.{67})/;

print $1 . "\n";

1;