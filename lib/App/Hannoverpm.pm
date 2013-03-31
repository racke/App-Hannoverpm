package App::Hannoverpm;
############################################################################
# App::Hannoverpm - Homepage of Perl Mongers group in Hanover, Germany.
# @copyright © 2013, Hannover.pm.
# @license http://creativecommons.org/publicdomain/zero/1.0/ CC0 1.0 Universal
############################################################################
# Perl pragmas.
use strict;
use warnings FATAL => 'all';
use utf8;
use version 0.77; our $VERSION = version->new('v0.1');

############################################################################
# Get use of other Perl modules.
use Dancer qw( :syntax );

############################################################################
# Main index route.
sub get_index_route {
  return template 'index';
}
get q{/} => \&get_index_route;

############################################################################
1;
