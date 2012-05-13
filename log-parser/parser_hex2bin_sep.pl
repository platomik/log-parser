#!/usr/bin/perl

use strict;
my $detected=0;

opendir(DIR, '.') or die "Couldn't open directory, $!";
foreach (sort grep(/^*.log$/,readdir(DIR)))
{
#    print "$_\n";		# print filename
    open FH,"<$_";
    read_file(*FH);
}
closedir DIR;

sub read_file
{
 while( <FH> ) {
	s/.*PuTTY.*//;		# whitening PuTTY
	s/^Dev.*//;
	s/^RAM.*//;
	s/\*+//;
	s/\#+//;
#	s/\W+//;
        next if /^(\s)*$/;  	# remove blank lines
	
	if ($_ =~ m/Cfg: EF/i) { 
		$detected=1;
	} else {
		if ($detected==1) {
#			print $_;
			 s/\W+//;
 			 next if /^(\s)*$/;
			 chomp;
			 for (my $i = 0; $i < length($_); $i += 1) {
				printf('%04b', hex(substr($_, $i, 1)))
			 }
			 print "\n";

			$detected=0;
		}
	}

 }
 close FH;
}
