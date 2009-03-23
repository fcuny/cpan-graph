package CPAN::cpants::prereq;
use base 'DBIx::Class';
use strict;
use warnings;

__PACKAGE__->load_components( qw/ Core/ );
__PACKAGE__->table( 'prereq' );

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
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'dist',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'requires' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'requires',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'version' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'version',
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
    'is_prereq' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'is_prereq',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'is_build_prereq' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'is_build_prereq',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'is_optional_prereq' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'is_optional_prereq',
        'is_nullable'       => 0,
        'size'              => 0
    },
);
__PACKAGE__->set_primary_key( 'id' );

package CPAN::cpants::modules;
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
    'dist' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'dist',
        'is_nullable'       => 1,
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
    'file' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'file',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'in_lib' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'in_lib',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'in_basedir' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'in_basedir',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'is_core' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'is_core',
        'is_nullable'       => 0,
        'size'              => 0
    },
);
__PACKAGE__->set_primary_key( 'id' );

package CPAN::cpants::kwalitee;
use base 'DBIx::Class';
use strict;
use warnings;

__PACKAGE__->load_components( qw/ Core/ );
__PACKAGE__->table( 'kwalitee' );

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
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'dist',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'abs_kw' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'abs_kw',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'abs_core_kw' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'abs_core_kw',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'kwalitee' => {
        'data_type'         => 'numeric',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'kwalitee',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'rel_core_kw' => {
        'data_type'         => 'numeric',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'rel_core_kw',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'extractable' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'extractable',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'extracts_nicely' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'extracts_nicely',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'has_version' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'has_version',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'has_proper_version' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'has_proper_version',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'no_cpants_errors' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'no_cpants_errors',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'has_readme' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'has_readme',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'has_manifest' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'has_manifest',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'has_meta_yml' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'has_meta_yml',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'has_buildtool' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'has_buildtool',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'has_changelog' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'has_changelog',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'no_symlinks' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'no_symlinks',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'has_tests' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'has_tests',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'proper_libs' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'proper_libs',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'is_prereq' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'is_prereq',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'use_strict' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'use_strict',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'use_warnings' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'use_warnings',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'has_test_pod' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'has_test_pod',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'has_test_pod_coverage' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'has_test_pod_coverage',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'no_pod_errors' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'no_pod_errors',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'has_working_buildtool' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'has_working_buildtool',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'manifest_matches_dist' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'manifest_matches_dist',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'has_example' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'has_example',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'buildtool_not_executable' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'buildtool_not_executable',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'has_humanreadable_license' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'has_humanreadable_license',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'metayml_is_parsable' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'metayml_is_parsable',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'metayml_conforms_spec_current' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'metayml_conforms_spec_current',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'metayml_has_license' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'metayml_has_license',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'metayml_conforms_to_known_spec' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'metayml_conforms_to_known_spec',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'has_license' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'has_license',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'prereq_matches_use' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'prereq_matches_use',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'build_prereq_matches_use' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'build_prereq_matches_use',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'no_generated_files' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'no_generated_files',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'run' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'run',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'has_version_in_each_file' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'has_version_in_each_file',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'has_tests_in_t_dir' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'has_tests_in_t_dir',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'no_stdin_for_prompting' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'no_stdin_for_prompting',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'easily_repackageable_by_fedora' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'easily_repackageable_by_fedora',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'easily_repackageable_by_debian' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'easily_repackageable_by_debian',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'easily_repackageable' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'easily_repackageable',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'fits_fedora_license' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'fits_fedora_license',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'metayml_declares_perl_version' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'metayml_declares_perl_version',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'no_large_files' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'no_large_files',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'has_separate_license_file' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'has_separate_license_file',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'has_license_in_source_file' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'has_license_in_source_file',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'metayml_has_provides' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'metayml_has_provides',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'uses_test_nowarnings' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'uses_test_nowarnings',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'latest_version_distributed_by_debian' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'latest_version_distributed_by_debian',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'has_no_bugs_reported_in_debian' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'has_no_bugs_reported_in_debian',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'has_no_patches_in_debian' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'has_no_patches_in_debian',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'distributed_by_debian' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'distributed_by_debian',
        'is_nullable'       => 0,
        'size'              => 0
    },
);
__PACKAGE__->set_primary_key( 'id' );

package CPAN::cpants::uses;
use base 'DBIx::Class';
use strict;
use warnings;

__PACKAGE__->load_components( qw/ Core/ );
__PACKAGE__->table( 'uses' );

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
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'dist',
        'is_nullable'       => 1,
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
    'in_code' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'in_code',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'in_tests' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'in_tests',
        'is_nullable'       => 0,
        'size'              => 0
    },
);
__PACKAGE__->set_primary_key( 'id' );

package CPAN::cpants::dist;
use base 'DBIx::Class';
use strict;
use warnings;

__PACKAGE__->load_components( qw/ Core/ );
__PACKAGE__->table( 'dist' );

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
    'run' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'run',
        'is_nullable'       => 1,
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
    'package' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'package',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'vname' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'vname',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'author' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'author',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'version' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'version',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'version_major' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'version_major',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'version_minor' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'version_minor',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'extension' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'extension',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'extractable' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'extractable',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'extracts_nicely' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'extracts_nicely',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'size_packed' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'size_packed',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'size_unpacked' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'size_unpacked',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'released' => {
        'data_type'         => 'date',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'released',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'files' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'files',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'files_list' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'files_list',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'dirs' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'dirs',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'dirs_list' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'dirs_list',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'symlinks' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'symlinks',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'symlinks_list' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'symlinks_list',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'bad_permissions' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'bad_permissions',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'bad_permissions_list' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'bad_permissions_list',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'file_makefile_pl' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'file_makefile_pl',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'file_build_pl' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'file_build_pl',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'file_readme' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'file_readme',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'file_manifest' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'file_manifest',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'file_meta_yml' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'file_meta_yml',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'file_signature' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'file_signature',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'file_ninja' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'file_ninja',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'file_test_pl' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'file_test_pl',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'file_changelog' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'file_changelog',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'dir_lib' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'dir_lib',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'dir_t' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'dir_t',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'dir_xt' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'dir_xt',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'broken_module_install' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'broken_module_install',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'manifest_matches_dist' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'manifest_matches_dist',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'buildfile_executable' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'buildfile_executable',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'license' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'license',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'metayml_is_parsable' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'metayml_is_parsable',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'file_license' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'file_license',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'needs_compiler' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'needs_compiler',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'got_prereq_from' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'got_prereq_from',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'is_core' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'is_core',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'file__build' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'file__build',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'file_build' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'file_build',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'file_makefile' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'file_makefile',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'file_blib' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'file_blib',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'file_pm_to_blib' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'file_pm_to_blib',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'stdin_in_makefile_pl' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'stdin_in_makefile_pl',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'stdin_in_build_pl' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'stdin_in_build_pl',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'external_license_file' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'external_license_file',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'file_licence' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'file_licence',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'licence_file' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'licence_file',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'license_file' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'license_file',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'license_type' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'license_type',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'no_index' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'no_index',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'ignored_files_list' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'ignored_files_list',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'license_in_pod' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'license_in_pod',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'license_from_yaml' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'license_from_yaml',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'license_from_external_license_file' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'license_from_external_license_file',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'test_files_list' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'test_files_list',
        'is_nullable'       => 1,
        'size'              => 0
    },
);
__PACKAGE__->set_primary_key( 'id' );

package CPAN::cpants::author;
use base 'DBIx::Class';
use strict;
use warnings;

__PACKAGE__->load_components( qw/ Core/ );
__PACKAGE__->table( 'author' );

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
    'pauseid' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'pauseid',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'name' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'name',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'email' => {
        'data_type'         => 'text',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'email',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'average_kwalitee' => {
        'data_type'         => 'numeric',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'average_kwalitee',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'num_dists' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'num_dists',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'rank' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'rank',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'prev_av_kw' => {
        'data_type'         => 'numeric',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'prev_av_kw',
        'is_nullable'       => 1,
        'size'              => 0
    },
    'prev_rank' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'prev_rank',
        'is_nullable'       => 0,
        'size'              => 0
    },
    'average_total_kwalitee' => {
        'data_type'         => 'numeric',
        'is_auto_increment' => 0,
        'default_value'     => undef,
        'is_foreign_key'    => 0,
        'name'              => 'average_total_kwalitee',
        'is_nullable'       => 1,
        'size'              => 0
    },
);
__PACKAGE__->set_primary_key( 'id' );

package CPAN::cpants;
use base 'DBIx::Class::Schema';
use strict;
use warnings;

__PACKAGE__->register_class( 'prereq', 'CPAN::cpants::prereq' );

__PACKAGE__->register_class( 'modules', 'CPAN::cpants::modules' );

__PACKAGE__->register_class( 'kwalitee', 'CPAN::cpants::kwalitee' );

__PACKAGE__->register_class( 'uses', 'CPAN::cpants::uses' );

__PACKAGE__->register_class( 'dist', 'CPAN::cpants::dist' );

__PACKAGE__->register_class( 'author', 'CPAN::cpants::author' );

1;
