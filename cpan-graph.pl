#!/usr/bin/perl -w
use strict;
use feature ':5.10';

use Getopt::Long;

use lib ( 'lib' );
use CPAN::Testers;
use CPAN::cpants;
use CPAN::mapcpan;
use DateTime;

my $options = GetOptions(
    'dbtest=s' => \my $db_test,
    'dball=s'  => \my $db_all,
    'dbout=s'  => \my $db_out,
);

# TODO 
# generer une carte des auteurs

my $sqltest
    = CPAN::Testers->connect( "dbi:SQLite:dbname=" . $db_test, '', '' );
my $sqlall = CPAN::cpants->connect( "dbi:SQLite:dbname=" . $db_all, '', '' );
my $dbmap = CPAN::cpanmap->connect( "dbi:SQLite:dbname=" . $db_out, "", "" );

$dbmap->deploy;

my $dists = $sqlall->resultset( 'dist' )->search( { is_core => 0 } );

while ( my $dist = $dists->next ) {
    print "processing ".$dist->package ."... ";
    my $map_package = $dbmap->resultset( 'packages' )
        ->find_or_create( { dist => $dist->dist, } );

    my $tests_pass = $sqltest->resultset( 'reports' )
        ->count( { distribution => $dist->dist, status => 'PASS' } );
    my $tests_fail = $sqltest->resultset( 'reports' )
        ->count( { distribution => $dist->dist, status => 'FAIL' } );
    my $total_tests = $tests_pass + $tests_fail;
    $total_tests = 1 if $total_tests == 0;
    my $tests_success = int( ( $tests_pass / $total_tests ) * 100 );

    my $author = $sqlall->resultset( 'author' )->find( $dist->author );
    my ($year, $month, $day) = $dist->released =~ /^(\d{4})-(\d{2})-(\d{2})/;
    next if (!defined $year || !defined $month || !defined $day);

    $map_package->update(
        {   tests_success => $tests_success,
            author        => $author->pauseid,
            version => $dist->version,
            released =>
                DateTime->new( year => $year, month => $month, day => $day ),
        }
    );

    my $deps = $sqlall->resultset( 'uses' )->search(
        {   dist     => $dist->id,
            in_code  => 1,
            in_tests => 0
        }
    );
    while ( my $dep = $deps->next ) {
        my $dist_dep = $sqlall->resultset( 'dist' )->find( $dep->in_dist );
        next
            if !defined $dep->in_dist
                || $dep->in_dist == 0
                || $dist_dep->is_core;
        my $pack_dep = $dbmap->resultset( 'packages' )
            ->find_or_create( { dist => $dist_dep->dist, } );
        my $node_from = $dbmap->resultset( 'edges' )->create(
            {   dist_from => $map_package->id,
                dist_to   => $pack_dep->id
            }
        );
    }
    say "done";
}

say "importing CPAN data is terminated";