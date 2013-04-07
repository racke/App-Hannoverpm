package App::Hannoverpm::NavigationItem;
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
use Moo;
use MooX::Types::MooseLike::Base qw( Str ArrayRef Bool );

############################################################################
has label => (
  is       => 'rw',
  isa      => Str,
  required => 1,
);
has link => (
  isa      => Str,
  is       => 'rw',
  required => 1,
);
has items => (
  is      => 'rw',
  isa     => ArrayRef,          # ['App::Hannoverpm::NavigationItem'],
  default => sub { return [] },
);
has active => (
  is      => 'rw',
  isa     => Bool,
  default => sub { return 0 },
);

############################################################################
sub activate {
  my ( $self, $active_uri ) = @_;
  my $link = $self->link;
  if ( $active_uri =~ m/^\Q$link\E/i ) {
    if ( $link =~ s{^https?://[^/]*/}{}ri ) {
      $self->active(1);
    }
    else {
      $self->active(0);
    }
  }
  else {
    $self->active(0);
  }
  $_->activate($active_uri) foreach ( @{ $self->items } );
  return $self;
}

############################################################################
1;
