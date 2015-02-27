package Octave::Parser;

use strict;
use warnings;

use Inline with => 'OctaveInline';
use Inline 'CPP';

sub new {
	_new(@_);
}

1;
__DATA__
__CPP__

/* have to redefine regexp because Octave's `class regexp`
 * conflicts with Perl's `struct regexp`.
 */
#define VERSION OCTAVE_VERSION
#define my_strftime octave_my_strftime
#define regexp octave_regexp
#include "oct.h"
#include "parse.h"

SV* _new(SV* clazz, char* c_str) {
	std::string str (c_str);
	SV* sv_tmp;

	octave_parser* p = new octave_parser( str );

	sv_tmp = sv_newmortal();
	sv_setref_pv(sv_tmp, "Octave::Parser", (void*)p);

	return SvREFCNT_inc( sv_tmp );
}

