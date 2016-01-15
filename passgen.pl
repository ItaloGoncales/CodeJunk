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

You can also create a password with special chars using -s option:

aluno@host:~$ perl passgen.pl 16 -s
IDO?l2KS"s<?@9G1

Trick: you can generate a file with a list of random passwords

aluno@host:~$ yes "passgen.pl" | xargs -i perl {} 8 >> fileofpasswords.txt

**This command will generate a file with 8 length passwords**

=cut

my $_SPECIAL;

sub passgen {
    my $len = shift;

    my @special_chars = ( 33 .. 47, 58 .. 64 );
    my @allowed_chars = ( 48 .. 57, 65 .. 90, 97 .. 122 );
    @allowed_chars = ( @allowed_chars, @special_chars ) if $_SPECIAL; 
    my $pass = "";

    while ( length $pass < $len ){
	$pass .= chr( $allowed_chars[int( rand( scalar @allowed_chars ) )] );
    } 

    print "$pass\n";
}

# Here the function is called;
my $_optcheck =  $ARGV[1];

$_SPECIAL = 1 if ( $_optcheck =~ m/[-s]{1}/ );

passgen($ARGV[0]);

=head2 AUTHOR

GONCALES - <italo.goncales@gmail.com>
Github: ItaloGoncales

=cut
