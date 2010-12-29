#!/usr/bin/perl

use strict;
use warnings;

use Pod::PseudoPod::LaTeX;

my $parser = Pod::PseudoPod::LaTeX->new();
my $fh;

#$parser->output_fh($fh);

$parser->parse_file("chapter_00.pod");

1;
