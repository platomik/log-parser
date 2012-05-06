#!/usr/bin/perl
use List::MoreUtils 'pairwise';

#use strict;
my $i=0;
my $ii=0;

open FH,"log-5minoff-zero.bin.log";

 while( <FH> ) {
        chomp;                 
	$i++;
	@chars = split '', $_;
	@sum = pairwise { $a + $b } @sum, @chars;	
 }

close FH;

 foreach (@sum){
	$ii++;
	if ($ii%32==0) { printf "\n";}
	printf "%.2f ",$_/$i;
 }
