#!perl

use strict;
use warnings;
use lib 'lib/';

use File::Basename;
use File::Spec::Functions;
use Pod::PseudoPod::LaTeX;

#die "$0 <files to pdfify>\n" unless @ARGV;

chomp(my @files = `ls build/chapters/chapter_0*.pod`); 

for my $file (@files)
{
    die "Cannot read '$file': $!\n" unless -e $file;
    my $outfile   = catfile(
        'build/tex',
        (fileparse( $file, qr/\.pod$/ ))[0] . '.tex'
    );
    open( my $fh, '>', $outfile ) or die "Can't write to '$outfile': $!\n";

    my $parser    = Pod::PseudoPod::LaTeX->new();
    $parser->output_fh( $fh );

    warn "$file -> $outfile\n";

    $parser->parse_file( $file );
}
