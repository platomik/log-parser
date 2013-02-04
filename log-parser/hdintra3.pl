#!/usr/bin/perl

$filename = $ARGV[0];
$cfgname = $ARGV[1];

$detected = 0;
$firsttime = 0;
$matches = 0;

open(INPUT_FILE, $filename)
	or die "Couldn't open $filename for reading!";

while (<INPUT_FILE>) {
	if ($_ =~ m/Cfg: $cfgname/i) {
		$matches++;
	}
}
#print "matches:",$matches,"\n";
close(INPUT_FILE);


for ($cntr = 1; $cntr < $matches+1; $cntr++) {
	# arr0
	$c = 0;
	$detected = 0;
	$firsttime = 0;
#	print "cntr:",$cntr,"\n";
	open(INPUT_FILE, $filename)
		or die "Couldn't open $filename for reading!";

	while (<INPUT_FILE>) {
		if ($_ =~ m/Cfg: $cfgname/i) {
			$detected=1;
			$c++;
#			print $c,"\n";
		}else{
			$hdintra=0;
			if (($detected == 1) and ($c>$cntr-1)){
				if ($c==$cntr) {
						@arr0 = split '', $_;
				}
				
				@arr1 = split '', $_;
				for ($i = 0; $i < $#arr1; $i++) {
					$hdintra = $hdintra + abs($arr1[$i]-$arr0[$i]);
				}
				if ($hdintra != 0) {print $hdintra,"\n";}	
				$detected=0;
			}
		}
	}
	close(INPUT_FILE);		
}