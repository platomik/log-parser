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
	s/#.*//;            	# whitening comments
	s/.*PuTTY.*//;		# whitening PuTTY
	s/\*\*.*//;		# whitening stars
        next if /^(\s)*$/;  	# remove blank lines
	chomp;              	# remove newline characters
	s/^\s+$//;
	s/\s+//;		# now it's a clear line 128 bit length
#	print $_."\n";	
#	print length(unpack("B*", $_))."\n";
        print length(unpack("B*", $_))."\n";
 }
 close FH;
}
