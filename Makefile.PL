use inc::Module::Install;

name     'Log-Dispatch-Dir';
all_from 'lib/Log/Dispatch/Dir.pm';
author   'Steven Haryanto <stevenharyanto@gmail.com>';
license  'perl';

build_requires 'Test::More';

requires 'File::Slurp';
requires 'File::Stat';
requires 'Params::Validate';
requires 'POSIX';
requires 'Taint::Util';

auto_install;

WriteAll;
