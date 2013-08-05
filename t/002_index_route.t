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
use Test::More tests => 1 + 2;
use Test::NoWarnings;

use App::Hannoverpm;
use Dancer::Test;
use Data::Dumper;

############################################################################
# Main index route.
route_exists(
  [ GET => q{/} ],
  q{Main index route handler exists},
) or diag Dumper read_logs;
response_status_is(
  [ GET => q{/} ],
  200,
  q{Main index route handler HTTP status is 200},
) or diag Dumper read_logs;

############################################################################
1;
