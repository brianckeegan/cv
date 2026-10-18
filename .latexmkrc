# latexmk settings for the CV. Run `latexmk` in this folder to build cv.pdf.
$pdf_mode = 1;              # pdflatex
@default_files = ('cv.tex');

# The footer date is the date of the last commit that changed the CV
# source, not the date of the build. pdfTeX takes \day, \month, and
# \year from SOURCE_DATE_EPOCH when FORCE_SOURCE_DATE is 1. The GitHub
# workflow sets SOURCE_DATE_EPOCH itself; outside git, the build date
# is used.
unless ($ENV{SOURCE_DATE_EPOCH}) {
  my $epoch = `git log -1 --format=%ct -- cv.tex cv.cls 2>/dev/null`;
  chomp $epoch;
  $ENV{SOURCE_DATE_EPOCH} = $epoch if $epoch;
}
$ENV{FORCE_SOURCE_DATE} = 1 if $ENV{SOURCE_DATE_EPOCH};
