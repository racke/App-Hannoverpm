############################################################################
# App::Hannoverpm - Homepage of Perl Mongers group in Hanover, Germany.
# @copyright © 2013, Hannover.pm.
# @license http://creativecommons.org/publicdomain/zero/1.0/ CC0 1.0 Universal
############################################################################
# Perl pragmas.
use strict;
use warnings FATAL => 'all';
use utf8;

############################################################################
# Get use of other Perl modules.
use Test::More tests => 1 + 1;
use Test::NoWarnings;

############################################################################
# Whole Dancer web application.
BEGIN { use_ok('App::Hannoverpm') }

############################################################################
1;
