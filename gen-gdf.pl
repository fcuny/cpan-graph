#!/usr/bin/perl -w
use strict;
use feature ':5.10';
use Getopt::Long;
use XML::Simple;
use YAML::Syck;
use IO::All;
use DateTime;

use lib ( 'lib' );
use CPAN::mapcpan;

my $options = GetOptions(
    'out=s'   => \my $output_gdf,
    'dbmap=s' => \my $db_map,
    'type=s'  => \my $type,
    'list=s'  => \my $list,
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

my $packages;
my $id_nodes;
if ( $type && $type eq 'author' ) {
    my $author_list = LoadFile( $list );
    $packages = $dbmap->resultset( 'packages' )->search(
        {   -and => [
                author   => { 'in', $author_list},
                released => { '>',  '1970-01-01' }
            ]
        }
    );
} else {
    $packages = $dbmap->resultset( 'packages' )->search(
        {   -and => [
                author   => { '!=', 'null' },
                released => { '>',  '1970-01-01' }
            ]
        }
    );
}

while ( my $package = $packages->next ) {
    my ( $year, $month, $day )
        = $package->released =~ /^(\d{4})-(\d{2})-(\d{2})/;
    push @{ $struct_graph->{ gexf }->{ graph }->{ nodes }->{ node } }, {
        id       => $package->id,
        label    => $package->dist,
        author   => $package->author,
        version => $package->version,
        datefrom     => join( '-', $year, $month, $day ),
    };
    $id_nodes->{$package->id}++;
}
say "done";

print "creating edges ... ";
my $id = 0;
my $edges;
if ( $type && $type eq 'author' ) {
    $edges = $dbmap->resultset( 'edges' )
        ->search( { dist_from => { 'in' => [ keys %$id_nodes ] }, } );
} else {
    $edges = $dbmap->resultset( 'edges' )->search;
}

while ( my $edge = $edges->next ) {
    next unless exists $id_nodes->{ $edge->dist_from };
    next unless exists $id_nodes->{ $edge->dist_to };
    push @{ $struct_graph->{ gexf }->{ graph }->{ edges }->{ edge } }, {
        cardinal => 1,
        source   => $edge->dist_from,
        target   => $edge->dist_to,
        type => 'dir',
        id => ++$id,
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
