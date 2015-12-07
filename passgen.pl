#!/usr/bin/perl

use strict;
use warnings;

=head1 ABOUT
This file generates a randomic passowrd. 

You just need to call it and pass how many chars you want
in your passord.

Usage:

aluno@host:~$ perl passgen.pl 6
a5Xb7j

aluno@host:~$ perl passgen.pl 16
5hYUc329bvZr2O63

Trick: you can generate a file with a list of random passwords

aluno@host:~$ yes "passgen.pl" | xargs -i perl {} 8 >> fileofpasswords.txt

**This command will generate a file with 8 length passwords**

=cut


sub passgen {
    my $len = shift;

    my @allowed_chars = ( 48 .. 57, 65 .. 90, 97 .. 122 );
    my @special_chars = ( @allowed_chars, 33 .. 47, 58 .. 64 ); 

    
}

# Here the function is called;
my $_optcheck =  $ARGV[1];

my $_SPECIAL = 1 if ( $_optcheck =~ m/[-s]{1}/ );

passgen($ARGV[0]);

=head2 AUTHOR

GONCALES - <italo.goncales@gmail.com>
Github: ItaloGoncales

=cut
