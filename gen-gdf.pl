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
print "preparing gexf ... ";
my $dbmap = CPAN::cpanmap->connect( "dbi:SQLite:dbname=" . $db_map, "", "" );

my $struct_graph;
$struct_graph->{ gexf }            = { version => "1.0" };
$struct_graph->{ gexf }->{ meta }  = { creator => [ 'rtgi' ] };
$struct_graph->{ gexf }->{ graph } = { type    => 'dynamic' };
$struct_graph->{ gexf }->{ graph }->{ attributes } = {
    class => 'node',
    type  => 'dynamic',
};
push @{ $struct_graph->{ gexf }->{ graph }->{ attributes }->{ attribute } },
    {
    id    => 0,
    title => 'dist',
    type  => 'string',
    };
say "done";

print "creating nodes ... ";
$struct_graph->{ gexf }->{ graph }->{ nodes } = {};
my $packages = $dbmap->resultset( 'packages' )->search;
while ( my $package = $packages->next ) {

    my $datefrom
        = ( $package->released )
        ? substr( $package->released, 0, 10 )
        : '1997-01-01';
    $datefrom =~ s/1970-01-01/1997-01-01/;

    #my $dateto = "";
    push @{ $struct_graph->{ gexf }->{ graph }->{ nodes }->{ node } }, {
        id       => $package->id,
        label    => $package->dist,
        author   => $package->author,
        datefrom => $datefrom,

        #dateto		=> $dateto,
        attvalue => [ { id => 0, value => $package->dist } ],
    };
}
say "done";

print "creating edges ... ";
my $id = 0;
$struct_graph->{ gexf }->{ graph }->{ edges } = {};
my $edges = $dbmap->resultset( 'edges' )->search;
while ( my $edge = $edges->next ) {
    push @{ $struct_graph->{ gexf }->{ graph }->{ edges }->{ edge } }, {
        cardinal => 1,
        source   => $edge->dist_from,
        target   => $edge->dist_to,
        type => 'dir',
        id => ++$id,
        #attvalue	=> [ { id => 3, value => 'prereq' } ],
    };
}
say "done";

print "generating gdf ... ";
my $xml = XMLout(
    $struct_graph,
    AttrIndent => 1,

    #GroupTags  => { node => 'attvalue' },
    KeepRoot => 1,
);
$xml > io( $output_gdf );
say "done";
