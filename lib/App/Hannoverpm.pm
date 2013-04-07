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
use HTML::Meta::Robots qw();
use DateTime qw();

############################################################################
sub security_checks {

  # Detect possible Cross-Site-Request-Forgery (CSRF) attacks. NONE changing
  # actions have to perform when 'csrf'-flag is true.
  if ( defined( my $referer = request->referer ) ) {
    my $uri_base = quotemeta request->uri_base;
    $uri_base =~ s/^https?/https?/i;  # allow switching http/https.
    vars 'csrf' => ( $referer =~ m/^$uri_base/i ? 0 : 1 );
  }
  else {
    vars 'csrf' => undef;
  }

  # There is NO possibility to switch the browser and carry the session. So
  # this situation is a attack! Destroy the session for security reasons.
  if ( setting('session') && ( my $request_ua = request->user_agent ) ) {
    if ( my $session_ua = session 'user_agent' ) {
      if ( $request_ua ne $session_ua ) {
        session->destroy;
      }
    }
    else {
      session 'user_agent' => $request_ua;
    }
  }

  return;
}
hook before => \&security_checks;

############################################################################
sub fix_template_tokens {
  my ($tokens) = @_;

  # Fix Content-Type token.
  if ( my $content_type = content_type ) {
    $tokens->{content_type} = $content_type;
  }
  else {
    content_type( $tokens->{content_type} = setting('content_type') );
  }

  # Fix Content-Charset token.
  $tokens->{content_charset} = setting 'charset';

  # Fix Content-Language token.
  $tokens->{content_language} ||= 'de';

  # Fix missing standard tokens.
  $tokens->{sitename} ||= 'Hannover.pm';
  $tokens->{content_robots} ||= HTML::Meta::Robots->new->content;
  $tokens->{content_keywords} ||=
    q{Perl,Programmiersprache,Mongers,Gruppe,Hannover,Deutschland};
  $tokens->{content_description} ||=
    q{Homepage der Perl Monger Gruppe aus Hannover, Deutschland.};
  $tokens->{content_date} = DateTime->now->ymd;

  return;
}
hook before_template_render => \&fix_template_tokens;

############################################################################
# Main index route.
sub get_index_route {
  return template 'index';
}
get q{/} => \&get_index_route;

############################################################################
1;
