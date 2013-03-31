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

############################################################################
# Get use of other Perl modules.
use Dancer qw( dance );
use App::Hannoverpm qw();

############################################################################
# Dispatch to Dancer web application.
dance;

############################################################################
1;
