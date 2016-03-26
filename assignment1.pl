#! /usr/bin/perl

use strict;
use warnings;
use Encode;

my $filename = "Yourname.txt";

open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";

print "Please Input Your Name: ";
my $name = <STDIN>;
print "Please Input Your Address: ";
my $address = <STDIN>;
print $fh "Your name: $name";
print $fh "Address: $address";
close $fh;

my $binfile = "Yourname.bin";

open(my $fht, '<', $filename) or die "Could not open file '$filename' $!";
open(my $bfm, '>', $binfile) or die "Unable to open: $!";
my $val;
while (my $row = <$fht>){
	chomp $row; 
	$val = unpack('B*',$row);
	print $bfm "$val\n";
}
close $fht;
close $bfm;

open(my $bf, '<', $binfile) or die;
open(my $fhl, '>', "last.txt") or die;
my $binv;
while (my $rowb = <$bf>){
	chomp $rowb;
	$binv = pack('B*', $rowb);
	print $fhl "$binv\n";
}
close $bf;
close $fhl
