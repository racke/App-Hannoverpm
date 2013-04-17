use utf8;
package App::Hannoverpm::Schema::Result::DatabaseInformation;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

App::Hannoverpm::Schema::Result::DatabaseInformation

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<database_information>

=cut

__PACKAGE__->table("database_information");

=head1 ACCESSORS

=head2 key

  data_type: 'varchar'
  is_nullable: 0
  size: 25

=head2 value

  data_type: 'varchar'
  is_nullable: 1
  size: 250

=cut

__PACKAGE__->add_columns(
  "key",
  { data_type => "varchar", is_nullable => 0, size => 25 },
  "value",
  { data_type => "varchar", is_nullable => 1, size => 250 },
);

=head1 PRIMARY KEY

=over 4

=item * L</key>

=back

=cut

__PACKAGE__->set_primary_key("key");


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-04-17 16:15:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:xeGowsJ9iq+Zw07wfaH7eQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
