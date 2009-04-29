#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'Log::Dispatch::Dir' );
}

diag( "Testing Log::Dispatch::Dir $Log::Dispatch::Dir::VERSION, Perl $], $^X" );
