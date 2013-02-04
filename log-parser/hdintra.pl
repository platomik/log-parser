#!/usr/bin/perl

$filename = $ARGV[0];
$cfgname = $ARGV[1];

$detected = 0;
$firsttime = 0;

open(INPUT_FILE, $filename)
	or die "Couldn't open $filename for reading!";

while (<INPUT_FILE>) {
	if ($_ =~ m/Cfg: $cfgname/i) { #	if ($_ =~ m/Cfg: /i) { 
		$detected=1;
		$c++;
	}else{
		$hdintra=0;
		if ($detected == 1){
			if (($c==1) and ($firsttime == 0)) {
				$firsttime = 1;
				@arr0 = split '', $_;
			}
		
			@arr1 = split '', $_;
			for ($i = 0; $i < $#arr1; $i++) {
				$hdintra = $hdintra + abs($arr1[$i]-$arr0[$i]);
			}
			print $hdintra,"\n";
			$detected=0;
		}
	}
}

close(INPUT_FILE);