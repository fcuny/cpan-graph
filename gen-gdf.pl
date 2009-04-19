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
$struct_graph->{ gexf }->{ graph } = { type    => 'static' }; 
# static si pas de dates
$struct_graph->{ gexf }->{ graph }->{ attributes } = {
    class => 'node',
    type  => 'static',
};
push @{ $struct_graph->{ gexf }->{ graph }->{ attributes }->{ attribute } },
    {
    id    => 0,
    #title => 'dist',
    type  => 'string',
    };
say "done";

print "creating nodes ... ";
$struct_graph->{ gexf }->{ graph }->{ nodes } = {};

my ($search, $packages, $id_nodes);
if ( $type && $type eq 'author' ) {
    if ( $list ) {
        my $author < io $list;
        my @author_list = split /\n/, $author;
        $search = {
            -and => [
                author   => { 'in', \@author_list },
                released => { '>',  '1970-01-01' }
            ]
        };
    } else {
        $search = {
            -and => [
                author   => { '!=', 'null' },
                released => { '>',  '1970-01-01' }
            ]
        };
    }
} else {
    $search = {
        -and => [
            author   => { '!=', 'null' },
            released => { '>',  '1970-01-01' }
        ]
    };
}

$packages = $dbmap->resultset( 'packages' )->search( $search );
my $id_authors;
my $authors;
my $i=0;
my $id_edges = 1;
while ( my $package = $packages->next ) {
    if ( $type eq 'author' ) {
        if (!exists $id_authors->{$package->author}){
            $id_authors->{$package->author} = ++$i;
        }
        if ( !exists $authors->{ $package->author } ) {
            push @{ $struct_graph->{ gexf }->{ graph }->{ nodes }->{ node } },
                {
                id    => $id_authors->{$package->author},
                label => $package->author,
                };
            $authors->{ $package->author }++;
        }
        my @edges = $package->edges;
        foreach my $edge ( @edges ) {
            next if $edge->dist_to->author eq $package->author;
            my $edges
                = $struct_graph->{ gexf }->{ graph }->{ edges }->{ edge };
            my @check = grep {
                       $_->{ source } eq $package->author
                    && $_->{ target } eq $edge->dist_to->author
            } @$edges;
            if ( @check ) {
                map { $_->{ cardinal }++ } @check;
            } else {
                if (!exists $id_authors->{$edge->dist_to->author}){
                    $id_authors->{$edge->dist_to->author} = ++$i;
                    push @{ $struct_graph->{ gexf }->{ graph }->{ nodes }->{ node } },
                        {
                        id    => $id_authors->{$edge->dist_to->author},
                        label => $edge->dist_to->author,
                        };
                    $authors->{ $edge->dist_to->author }++;
                }
                push @{ $struct_graph->{ gexf }->{ graph }->{ edges }
                        ->{ edge } },
                    {
                        id => $id_edges++,
                    cardinal => 1,
                    source   => $id_authors->{$package->author},
                    target   => $id_authors->{$edge->dist_to->author},
                    type     => 'dir',
                    };
            }
        }
    } else {
        my ( $year, $month, $day )
            = $package->released =~ /^(\d{4})-(\d{2})-(\d{2})/;
        push @{ $struct_graph->{ gexf }->{ graph }->{ nodes }->{ node } },
            {
            id       => $package->id,
            label    => $package->dist,
            author   => $package->author,
            version  => $package->version,
            datefrom => join( '-', $year, $month, $day ),
            };
        $id_nodes->{ $package->id }++;
    }
}
say "done";

print "creating edges ... ";
my $id = 0;
my $edges;
if ( !$type ) {
    $edges = $dbmap->resultset( 'edges' )->search;
    while ( my $edge = $edges->next ) {
        next unless exists $id_nodes->{ $edge->dist_from };
        next unless exists $id_nodes->{ $edge->dist_to };
        push @{ $struct_graph->{ gexf }->{ graph }->{ edges }->{ edge } },
            {
            cardinal => 1,
            source   => $edge->dist_from,
            target   => $edge->dist_to,
            type     => 'dir',
            id       => ++$id,
            };
    }
}

say "done";

print "generating gdf ... ";
my $xml = XMLout(
    $struct_graph,
    AttrIndent => 1,
    KeepRoot => 1,
);
$xml > io( $output_gdf );
say "done";
