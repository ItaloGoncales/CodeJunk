#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

my @numbers = ( 0,7, 12, 3, 78, 45, 22, 90, 91, 97, 4, 13, 5 );

my @string = ( 'DB723235555BR', 'DB723235533BR', 'DB723235547BR', 'DB723235564BR', 'DB723235635BR', 'DB723235595BR', 'DB723235578BR', 'DB723235618BR', 'DB723235621BR', 'DB723235581BR', 'DB723235604BR' );


my @new_numbers = sort { $a <=> $b} @numbers;
my @new_string = sort @string;

#print Dumper @numbers;
#print Dumper @new_numbers;

print Dumper @string;
print Dumper @new_string;

1; 
