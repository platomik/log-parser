#!/usr/bin/perl

$filename = $ARGV[0];

open(INPUT_FILE, $filename)
	or die "Couldn't open $filename for reading!";

while (<INPUT_FILE>) {
	s/.*PuTTY.*//;		# whitening PuTTY
	if ($_ =~ m/^Cfg:/i) { 
		print $_;
	}
	s/.*:.*//;
	s/\W+//;
        next if /^(\s)*$/;  	# remove blank lines
		chomp;              	# remove newline characters
    	for (my $i = 0; $i < length($_); $i += 1) {
        	printf('%04b', hex(substr($_, $i, 1)));
    	}
    	print "\n";
}

close(INPUT_FILE);