
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  'build_requires' => {
    'Module::Build' => '0.3601'
  },
  'configure_requires' => {
    'Module::Build' => '0.3601'
  },
  'dist_abstract' => 'Log messages to separate files in a directory, with rotate options',
  'dist_author' => [
    'Steven Haryanto <stevenharyanto@gmail.com>'
  ],
  'dist_name' => 'Log-Dispatch-Dir',
  'dist_version' => '0.10',
  'license' => 'perl',
  'module_name' => 'Log::Dispatch::Dir',
  'recommends' => {},
  'recursive_test_files' => 1,
  'requires' => {
    'File::Slurp' => '0',
    'Log::Dispatch' => '0',
    'POSIX' => '0',
    'Params::Validate' => '0',
    'Probe::Perl' => '0',
    'Taint::Util' => '0',
    'perl' => '5.010000'
  },
  'script_files' => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
