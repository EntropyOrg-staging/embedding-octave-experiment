#!/usr/bin/env perl


use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/lib";

use Path::Class;
use Inline CPP =>
	Config =>
	#print_info => 1,
	#force_build => 1,
	clean_after_build => 0;
use Octave::Parser;

my $code = file('example.m')->slurp;
my $p = Octave::Parser->new( $code );

use DDP; p $p;

# /usr/include/octave-3.8.2/octave/parse.h

