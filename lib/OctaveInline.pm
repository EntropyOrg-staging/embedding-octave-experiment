package OctaveInline;

use strict;
use warnings;

sub Inline {
	return unless $_[-1] eq 'CPP';
	my $oct_inc = join " ", map { "-I$_" } (
		`octave-config -p OCTINCLUDEDIR`,
		"/usr/include/hdf5/serial",
		);
	my $oct_libs  = join(' ', "-L".`octave-config -p LIBDIR`, '-loctinterp');
	+{
		INC => $oct_inc,
		LIBS => $oct_libs,
		#AUTO_INCLUDE => q{
			##include <Rinternals.h>
			##include <Rembedded.h>
			##include <R_ext/Parse.h> },
	};
}

1;
