
use strict;
use warnings;



use ExtUtils::MakeMaker 6.11;



my %WriteMakefileArgs = (
                       'test' => {
                                   'TESTS' => 't/*.t'
                                 },
                       'NAME' => 'Log::Dispatch::Dir',
                       'DISTNAME' => 'Log-Dispatch-Dir',
                       'AUTHOR' => 'Steven Haryanto <stevenharyanto@gmail.com>',
                       'ABSTRACT' => 'Log messages to separate files in a directory, with rotate options',
                       'EXE_FILES' => [],
                       'VERSION' => '0.04',
                       'LICENSE' => 'perl',
                       'PREREQ_PM' => {
                                        'Pod::Coverage' => '0.18',
                                        'File::Stat' => '0',
                                        'Test::More' => '0',
                                        'Test::Pod::Coverage' => '1.08',
                                        'Params::Validate' => '0',
                                        'POSIX' => '0',
                                        'ExtUtils::MakeMaker' => '6.11',
                                        'Log::Dispatch' => '0',
                                        'Taint::Util' => '0',
                                        'File::Slurp' => '0'
                                      }
                     );


delete $WriteMakefileArgs{LICENSE}
  unless eval { ExtUtils::MakeMaker->VERSION(6.31) };

WriteMakefile(%WriteMakefileArgs);



