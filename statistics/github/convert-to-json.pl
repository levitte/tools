#!/usr/bin/perl
#
# Usage:
#
# perl convert-to-json.pl < perl-cache > json-cache
#
# Convert a data cache created by an older version of contributpr-collect
# (which output the result of Data::Dumper) to JSON output.

use strict;
use warnings;
use JSON;

my %data;
{
    local $/ = undef;
    (my $datastr = <STDIN>) =~ s|^\$VAR\d\s*=\s*||;
    my $data = eval $datastr;
    %data = %$data;
}

print encode_json(\%data);
