#!/usr/bin/perl -w
use strict;

my @datain;
my @decoded;
#open file and read data
open F,"test_results.txt" or die "Can't open file";
my @lines = <F>;
close F;

chomp @lines;
my $scalar = @lines;

foreach $a (@lines){
    
    #if($a =~ /^#\s*0:/||$a =~ /^#\s*1:/){
    #    $a = s/^$//;
    #}
    if($a =~ /z$/ || $a =~ /x$/){
        $a = s/^.*$//;
    }
    if($a =~ /^.*0x(.{2}).*ox(.{2})$/){
       push@datain,$1;
       push@decoded,$2;
    }
}
pop@datain;

chomp @datain;
chomp @decoded;

my $index = 0;
# modify and write
open F, ">true_or_false.txt" or die "Can't open file for write.";
foreach $a (@datain){
    print F "$a\t";
    print F "$decoded[$index]\t";
    if($a == $decoded[$index]){
        print F "true\n";
    }else{
        print F "false\n";
    }
    $index = $index+1;
}


close F;