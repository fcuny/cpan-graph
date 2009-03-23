package CPAN::Testers::reports;
use base 'DBIx::Class';
use strict;
use warnings;

__PACKAGE__->load_components(qw/ Core/);
__PACKAGE__->table('reports');


__PACKAGE__->add_columns(
    'id' => {
      'data_type' => 'INTEGER',
      'is_auto_increment' => 0,
      'default_value' => undef,
      'is_foreign_key' => 0,
      'name' => 'id',
      'is_nullable' => 0,
      'size' => 0
    },
    'status' => {
      'data_type' => 'TEXT',
      'is_auto_increment' => 0,
      'default_value' => undef,
      'is_foreign_key' => 0,
      'name' => 'status',
      'is_nullable' => 1,
      'size' => 0
    },
    'distribution' => {
      'data_type' => 'TEXT',
      'is_auto_increment' => 0,
      'default_value' => undef,
      'is_foreign_key' => 0,
      'name' => 'distribution',
      'is_nullable' => 1,
      'size' => 0
    },
    'version' => {
      'data_type' => 'TEXT',
      'is_auto_increment' => 0,
      'default_value' => undef,
      'is_foreign_key' => 0,
      'name' => 'version',
      'is_nullable' => 1,
      'size' => 0
    },
    'perl' => {
      'data_type' => 'TEXT',
      'is_auto_increment' => 0,
      'default_value' => undef,
      'is_foreign_key' => 0,
      'name' => 'perl',
      'is_nullable' => 1,
      'size' => 0
    },
    'osname' => {
      'data_type' => 'TEXT',
      'is_auto_increment' => 0,
      'default_value' => undef,
      'is_foreign_key' => 0,
      'name' => 'osname',
      'is_nullable' => 1,
      'size' => 0
    },
    'osvers' => {
      'data_type' => 'TEXT',
      'is_auto_increment' => 0,
      'default_value' => undef,
      'is_foreign_key' => 0,
      'name' => 'osvers',
      'is_nullable' => 1,
      'size' => 0
    },
    'archname' => {
      'data_type' => 'TEXT',
      'is_auto_increment' => 0,
      'default_value' => undef,
      'is_foreign_key' => 0,
      'name' => 'archname',
      'is_nullable' => 1,
      'size' => 0
    },
);
__PACKAGE__->set_primary_key('id');



package CPAN::Testers;
use base 'DBIx::Class::Schema';
use strict;
use warnings;

__PACKAGE__->register_class('reports', 'CPAN::Testers::reports');

1;
