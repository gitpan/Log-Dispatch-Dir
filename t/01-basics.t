#!perl -T

use strict;
use warnings;
use Test::More tests => 18;
use File::Temp qw(tempdir);
use File::Stat qw(:stat);
use File::Slurp;

BEGIN {
    use_ok('Log::Dispatch::Dir');
}

#use lib './t';
#require 'testlib.pm';

my $dir = tempdir(CLEANUP=>1);
my $log;

$log = new Log::Dispatch::Dir(name=>'dir1', min_level=>'info', dirname=>"$dir/dir1", permissions=>0700);
my $st = stat("$dir/dir1");
is($st->mode & 0777, 0700, "permissions 1");

$log = new Log::Dispatch::Dir(name=>'dir1', min_level=>'info', dirname=>"$dir/dir1", permissions=>0750);
$st = stat("$dir/dir1");
is($st->mode & 0777, 0750, "permissions 2");

$log->log_message(message=>101);
my @f = glob "$dir/dir1/*";
is(scalar(@f), 1, "log_message 1a");
is(read_file($f[0]), "101", "log_message 1b");

$log->log_message(message=>102);
@f = glob "$dir/dir1/*";
is(scalar(@f), 2, "log_message 2a");
is(join(".", map {read_file($_)} @f), "101.102", "log_message 2b");

$log->log_message(message=>103);
@f = glob "$dir/dir1/*";
is(scalar(@f), 3, "log_message 3a");
is(join(".", map {read_file($_)} @f), "101.102.103", "log_message 3b");

# default filename_pattern: %Y%m%d-%H%M%S.%{pid}
for (my $i=0; $i<@f; $i++) {
    like($f[$i], qr!^.+/\d{4}\d{2}\d{2}-\d{2}\d{2}\d{2}\.$$(\.\d+)?$!, "default filename_pattern $i");
}

# filename_pattern
$log = new Log::Dispatch::Dir(name=>'dir2', min_level=>'info', dirname=>"$dir/dir2", filename_pattern=>"msg");
$log->log_message(message=>101);
$log->log_message(message=>102);
$log->log_message(message=>103);
@f = glob "$dir/dir2/*";
for (my $i=0; $i<@f; $i++) {
    like($f[$i], qr!^.+/msg(\.\d+)?$!, "filename_pattern $i");
}

# filename_sub
$log = new Log::Dispatch::Dir(name=>'dir3', min_level=>'info', dirname=>"$dir/dir3", filename_sub=>sub {my %p=@_; $p{message}});
$log->log_message(message=>100);
$log->log_message(message=>101);
$log->log_message(message=>102);
@f = glob "$dir/dir3/*";
for (my $i=0; $i<@f; $i++) {
    like($f[$i], qr!^.+/10$i$!, "filename_sub $i");
}