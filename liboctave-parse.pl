#!/usr/bin/env perl


use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/lib";

use Inline with => 'OctaveInline';
use Inline CPP =>;
	

print "9 + 16 = ", add(9, 16), "\n";
print "9 - 16 = ", subtract(9, 16), "\n";

__END__
__CPP__

#include "config.h"
#include "parse.h"

int add(int x, int y) {
	return x + y;
}

int subtract(int x, int y) {
	return x - y;
}
