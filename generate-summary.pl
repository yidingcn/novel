#!/usr/bin/perl -CS
use 5.012;
use utf8;

for(sort
    {chapter_index($a) <=> chapter_index($b)}
    map {utf8::decode($_); $_} <*.md>) {
    next if /README/;
    /(.*).md/ && say "- [$1](./$_)";
}

sub chapter_index { $_[0] =~ /^第(.*)章/ ? chn2num($1) : -1 }

sub chn2num {
    $_ = shift;
    tr/一二三四五六七八九/123456789/;
    s/^(?=十)/1/;s/十$/0/;tr/十//dr;
}
