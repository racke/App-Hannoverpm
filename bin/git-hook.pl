#!/usr/bin/env perl
use Web::Simple 'GITWEBHOOK';

{
  package GITWEBHOOK;
  use autodie;
  sub dispatch_request {
    system("git pull origin master");
    system("service app_hannoverpm restart");
    return [ 201, [], [] ]
  }
}

GITWEBHOOK->run_if_script;
