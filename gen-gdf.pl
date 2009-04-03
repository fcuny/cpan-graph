#!/usr/bin/perl -w
use strict;
use feature ':5.10';
use Getopt::Long;
use XML::Simple;
use YAML::Syck;
use IO::All;

use lib ( 'lib' );
use CPAN::mapcpan;

my $options = GetOptions(
    'out=s'   => \my $output_gdf,
    'dbmap=s' => \my $db_map
);

my $dbmap = CPAN::cpanmap->connect( "dbi:SQLite:dbname=" . $db_map, "", "" );

my $struct_graph;

my $packages = $dbmap->resultset( 'packages' )->search;
print "creating nodes ... ";

$struct_graph->{graph}->{attributes} = {
    class => "node",
    type => "dynamic",
};

while ( my $package = $packages->next ) {
    $struct_graph->{ graph }->{ nodes }->{ $package->id } = {
        id       => $package->id,
        label    => $package->dist,
        author   => $package->author,
        date     => $package->released,
        attvalue => [ { id => 0, value => $package->dist } ],
    };
}
say "done";

my $edges = $dbmap->resultset( 'edges' )->search;
say "creating edges ... ";
while ( my $edge = $edges->next ) {
    push @{ $struct_graph->{ graph }->{ edges } },
        {
        cardinal => 1,
        source   => $edge->dist_from,
        target   => $edge->dist_to,
        attvalue => [ { id => 3, value => 'prereq' } ],
        };
}
say "done";

print "generating gdf ... ";
my $xml = XMLout(
    $struct_graph,
    AttrIndent => 1,
    GroupTags  => { node => 'attvalue' }
);
$xml > io( $output_gdf );
say "done";