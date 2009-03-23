#!/opt/perl/bin/perl -w
use strict;
use feature ':5.10';
use Getopt::Long;

use lib ( 'lib' );
use CPAN::mapcpan;

my $options = GetOptions(
    'out=s'   => \my $output_gdf,
    'dbmap=s' => \my $db_map
);

my $dbmap = CPAN::cpanmap->connect( "dbi:SQLite:dbname=" . $db_map, "", "" );

my $array_edges;
my $hash_nodes;

my $packages = $dbmap->resultset( 'packages' )->search;
say "create nodes";
while ( my $package = $packages->next ) {
    $hash_nodes->{ $package->id } = {
        tests  => $package->tests_success,
        name   => $package->dist,
        author => $package->author,
        date   => $package->released,
    };
}

my $edges = $dbmap->resultset( 'edges' )->search;
say "create edges";
while ( my $edge = $edges->next ) {
    push @$array_edges,
        {
        node1    => $edge->dist_from,
        node2    => $edge->dist_to,
        directed => 'true',
        };
}

#my $out = "nodedef>name VARCHAR,label VARCHAR,tests INTEGER,author VARCHAR,date VARCHAR\n";
#foreach my $key ( keys %$hash_nodes ) {
    #$out
        #.= $key . ","
        #. $hash_nodes->{ $key }->{ name } . ","
        #. $hash_nodes->{ $key }->{ tests } . ","
        #. $hash_nodes->{ $key }->{ author } . ","
        #. $hash_nodes->{ $key }->{ date } . "\n";
#}
#$out .= "edgedef>node1 VARCHAR,node2 VARCHAR,directed BOOLEAN\n";
#foreach my $edge ( @$array_edges ) {
    #$out
        #.= $edge->{ node1 } . ","
        #. $edge->{ node2 } . ","
        #. $edge->{ directed } . "\n";
#}

#open my $fh_gdf, '>', $output_gdf or die $!;
#print $fh_gdf $out;
#close $fh_gdf;