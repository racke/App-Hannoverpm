use utf8;
package App::Hannoverpm::Schema::Result::UsersRole;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

App::Hannoverpm::Schema::Result::UsersRole - Users has roles

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

=head1 TABLE: C<users_roles>

=cut

__PACKAGE__->table("users_roles");

=head1 ACCESSORS

=head2 user_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

Internal numerical user identifier

=head2 role_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

Internal numerical role identifier

=cut

__PACKAGE__->add_columns(
  "user_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "role_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</user_id>

=item * L</role_id>

=back

=cut

__PACKAGE__->set_primary_key("user_id", "role_id");

=head1 RELATIONS

=head2 role

Type: belongs_to

Related object: L<App::Hannoverpm::Schema::Result::Role>

=cut

__PACKAGE__->belongs_to(
  "role",
  "App::Hannoverpm::Schema::Result::Role",
  { role_id => "role_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+BOtd+QSzHQVD8FqE+xXTw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
