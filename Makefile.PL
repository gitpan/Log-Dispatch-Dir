
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
                       'VERSION' => '0.05',
                       'LICENSE' => 'perl',
                       'PREREQ_PM' => {
                                        'Test::More' => '0',
                                        'Pod::Coverage' => '0.18',
                                        'Params::Validate' => '0',
                                        'Test::Pod::Coverage' => '1.08',
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



