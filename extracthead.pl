#!/usr/bin/perl -w
print "Usage = Extract fasta headers and Replace  with short names for phylip alignment.\n";
print "perl extracthead.pl <fasta file of all sequneces> \n";
$i=1;
$f = $ARGV[0];
open(F, $f);
open(F1, ">$f\_input.txt");
open(F2, ">$f\_short_names.fasta");
@file=<F>;
foreach(@file)
	{
		chomp$_;
		if($_=~m/^>/)
			{
				print F1 "$_\tseq$i\n";
				$_=">seq$i";
				$i+=1;
			}
		print F2 "$_\n";
	}
