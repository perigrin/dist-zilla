use strict;
use warnings;
package Dist::Zilla::App::Command::smoke;
# ABSTRACT: smoke your dist
use Dist::Zilla::App -command;
require Dist::Zilla::App::Command::test;

=head1 SYNOPSIS

Runs your (built) distribution in Smoke Testing Mode.

    dzil smoke

Otherwise identical to

    AUTOMATED_TESTING=1 dzil test

See L<Dist::Zilla::App::Command::test> for more.

=cut

sub abstract { 'smoke your dist' }

sub run {
  my $self = shift;

  local $ENV{AUTOMATED_TESTING} = 1;
  local @ARGV = qw(test);

  return $self->app->run;
}

1;
