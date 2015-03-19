#!/usr/bin/perl

use warnings;
use strict;
{
    package BfxServer;

    use HTTP::Server::Simple::CGI;
    use base qw(HTTP::Server::Simple::CGI);

    sub handle_request {
        my $self = shift;
        my $cgi = shift;
        my $price = `node bfx.js`;
        print "HTTP/1.0 200 OK\r\n", $cgi->header, $price;
    }
}
my $pid = BfxServer->new(9876)->background();
print "Use 'kill $pid' to stop server.\n";
