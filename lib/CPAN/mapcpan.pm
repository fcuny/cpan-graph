package CPAN::cpanmap::edges;
use base 'DBIx::Class';
use strict;
use warnings;

__PACKAGE__->load_components( qw/ Core/ );
__PACKAGE__->table( 'edges' );

__PACKAGE__->add_columns(
    'id' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'id',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'dist_from' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'dist_from',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'dist_to' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'dist_to',
        'is_nullable'       => 0,
        'size'              => 0
    },
);
__PACKAGE__->set_primary_key('id');

package CPAN::cpanmap::packages;
use base 'DBIx::Class';
use strict;
use warnings;

__PACKAGE__->load_components( qw/InflateColumn::DateTime Core/ );
__PACKAGE__->table( 'packages' );

__PACKAGE__->add_columns(
    'id' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'id',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'dist' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'dist',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'tests_success' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => 0,
        'is_foreign_key'    => 0,
        'name'              => 'tests_success',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'author' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'author',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'released' => {
        'data_type'         => 'datetime',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'released',
        'is_nullable'       => 1,
        'size'              => 0
    }
);
__PACKAGE__->set_primary_key('id');

package CPAN::cpanmap::modules;
use base 'DBIx::Class';
use strict;
use warnings;

__PACKAGE__->load_components( qw/ Core/ );
__PACKAGE__->table( 'modules' );

__PACKAGE__->add_columns(
    'id' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'id',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'module' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'module',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'in_dist' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'in_dist',
        'is_nullable'       => 1,
        'size'              => 0
    },
);
__PACKAGE__->set_primary_key('id');

package CPAN::cpanmap;
use base 'DBIx::Class::Schema';
use strict;
use warnings;

__PACKAGE__->register_class( 'edges',    'CPAN::cpanmap::edges' );
__PACKAGE__->register_class( 'packages', 'CPAN::cpanmap::packages' );
__PACKAGE__->register_class( 'modules',  'CPAN::cpanmap::modules' );

1;
