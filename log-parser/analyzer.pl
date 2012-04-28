#!/usr/bin/perl
use List::MoreUtils 'pairwise';

#use strict;
my $i=0;
my $ii=0;

open FH,"2.txt";

 while( <FH> ) {
        chomp;                 
	$i++;
	@chars = split '', $_;
	@sum = pairwise { $a + $b } @sum, @chars;	
 }

close FH;

 foreach (@sum){
	printf "%.2f ",$_/$i;
 }
