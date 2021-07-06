#!/usr/bin/perl -w
use strict;

my %hashfirst;
my %hashsecond;
my $a,$b;

%hashfirst = (0,'0',1,'1',2,'2',3,'3',4,'4',5,'5',6,'6',7,'7',8,'8',9,'9',10,'a',11,'b',12,'c',13,'d',14,'e',15,'f');
%hashsecond = (0,'0',1,'1',2,'2',3,'3',4,'4',5,'5',6,'6',7,'7',8,'8',9,'9',10,'a',11,'b',12,'c',13,'d',14,'e',15,'f');

my @keysfirst = keys %hashfirst;
my @keyssecond = keys %hashsecond;
open F, ">test.txt" or die "Can't open file for write.";
foreach $a(@keysfirst){
    foreach $b(@keyssecond){
        print F "$hashfirst{$a}";
        print F "$hashsecond{$b}\n";
    }
}
close F;