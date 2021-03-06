#!/usr/bin/perl

use strict;
use warnings;

use Term::ProgressBar;
use Data::Dumper;

my $max = 33333333;

my $progress = Term::ProgressBar->new({name  => 'Powers',
                                         count => $max,
                                         ETA   => 'linear',
                                         fh    => \*STDOUT,
                                         });
  $progress->max_update_rate(1);
  my $next_update = 0;

  for (0..$max) {
    my $is_power = 0;

    for(my $i = 0; 2**$i <= $_; $i++) {
      if ( 2**$i == $_ ) {
        $is_power = 1;
        #$progress->message(sprintf "Found %8d to be 2 ** %2d", $_, $i);
      }
    }
    $next_update = $progress->update($_)
      if $_ > $next_update;
  }
  $progress->update($max)
      if $max >= $next_update;
