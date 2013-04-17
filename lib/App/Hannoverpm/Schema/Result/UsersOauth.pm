use utf8;
package App::Hannoverpm::Schema::Result::UsersOauth;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

App::Hannoverpm::Schema::Result::UsersOauth - Users has external OAuth ids

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

=head1 TABLE: C<users_oauth>

=cut

__PACKAGE__->table("users_oauth");

=head1 ACCESSORS

=head2 user_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

Internal numerical user identifier

=head2 service

  data_type: 'varchar'
  is_nullable: 0
  size: 25

OAuth service like GitHub, Twitter or Facebook

=head2 external_user_id

  data_type: 'varchar'
  is_nullable: 0
  size: 250

External user identification string from the OAuth service

=cut

__PACKAGE__->add_columns(
  "user_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "service",
  { data_type => "varchar", is_nullable => 0, size => 25 },
  "external_user_id",
  { data_type => "varchar", is_nullable => 0, size => 250 },
);

=head1 PRIMARY KEY

=over 4

=item * L</service>

=item * L</external_user_id>

=back

=cut

__PACKAGE__->set_primary_key("service", "external_user_id");

=head1 RELATIONS

=head2 user

Type: belongs_to

Related object: L<App::Hannoverpm::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "user",
  "App::Hannoverpm::Schema::Result::User",
  { user_id => "user_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-04-17 16:15:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BQD+3AmBh3wXeaUUN6mV8A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
