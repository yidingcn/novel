#!/usr/bin/perl
use 5.012;

for(sort {chapter_index($a) <=> chapter_index($b)} <*.md>) {
    next if /README|SUMMARY/;
    /(.*).md/ && say "- [$1](./$_)";
}

sub chapter_index { $_[0] =~ /^第(.*)章/ ? chn2num($1) : -1 }

sub chn2num {
    $_ = shift;
    return 10 if $_ eq '十';
    s/一/1/g;s/二/2/g;s/三/3/g;
    s/四/4/g;s/五/5/g;s/六/6/g;
    s/七/7/g;s/八/8/g;s/九/9/g;
    s/十$/0/;s/^十/1/;s/十//r;
}
