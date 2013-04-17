use utf8;
package App::Hannoverpm::Schema::Result::Role;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

App::Hannoverpm::Schema::Result::Role - Generic role data

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

=head1 TABLE: C<roles>

=cut

__PACKAGE__->table("roles");

=head1 ACCESSORS

=head2 role_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

Internal numerical role identifier

=head2 role_name

  data_type: 'varchar'
  is_nullable: 0
  size: 25

Internal role name used in source code

=cut

__PACKAGE__->add_columns(
  "role_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "role_name",
  { data_type => "varchar", is_nullable => 0, size => 25 },
);

=head1 PRIMARY KEY

=over 4

=item * L</role_id>

=back

=cut

__PACKAGE__->set_primary_key("role_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<IDX_ROLES_ROLENAME>

=over 4

=item * L</role_name>

=back

=cut

__PACKAGE__->add_unique_constraint("IDX_ROLES_ROLENAME", ["role_name"]);

=head1 RELATIONS

=head2 users_roles

Type: has_many

Related object: L<App::Hannoverpm::Schema::Result::UsersRole>

=cut

__PACKAGE__->has_many(
  "users_roles",
  "App::Hannoverpm::Schema::Result::UsersRole",
  { "foreign.role_id" => "self.role_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 users

Type: many_to_many

Composing rels: L</users_roles> -> user

=cut

__PACKAGE__->many_to_many("users", "users_roles", "user");


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-04-17 16:15:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:aT6ihA1XbZoOiDYf48VSIg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
