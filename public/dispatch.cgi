#!/usr/bin/env perl
############################################################################
# App::Hannoverpm - Homepage of Perl Mongers group in Hanover, Germany.
# @copyright © 2013, Hannover.pm.
# @license http://creativecommons.org/publicdomain/zero/1.0/ CC0 1.0 Universal
############################################################################
# Perl pragmas.
use strict;
use warnings FATAL => 'all';
use utf8;
use Carp qw( croak );

############################################################################
# Get use of other Perl modules.
use Dancer qw( :syntax );
use FindBin qw( $RealBin );
use Plack::Runner qw( path );

############################################################################
# For some reason Apache SetEnv directives dont propagate correctly to the
# dispatchers, so forcing PSGI and env here is safer.
set apphandler  => 'PSGI';
set environment => 'production';

############################################################################
# Find PSGI executable.
my $psgi = path( $RealBin, q{..}, 'bin', 'app.pl' );
if ( !-r $psgi ) {
  croak qq{Unable to read startup script: $psgi};
}

############################################################################
# Dispatch to Dancer web application.
Plack::Runner->run($psgi);

############################################################################
1;
