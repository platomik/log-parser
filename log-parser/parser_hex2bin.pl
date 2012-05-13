#!/usr/bin/perl

use strict;

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
	s/.*:.*//;
	s/\W+//;
        next if /^(\s)*$/;  	# remove blank lines
	chomp;              	# remove newline characters
    	for (my $i = 0; $i < length($_); $i += 1) {
        	printf('%04b', hex(substr($_, $i, 1)))
    	}
    	print "\n";
 }
 close FH;
}
