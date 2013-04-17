use utf8;
package App::Hannoverpm::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

App::Hannoverpm::Schema::Result::User - Generic user data

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

=head1 TABLE: C<users>

=cut

__PACKAGE__->table("users");

=head1 ACCESSORS

=head2 user_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

Internal numerical user identifier

=head2 display_name

  data_type: 'varchar'
  is_nullable: 1
  size: 25

Display name e.g. shown in posts, comments or user profile.

=head2 email

  data_type: 'varchar'
  is_nullable: 1
  size: 254

E-mail address

=head2 prefered_language

  data_type: 'varchar'
  is_nullable: 0
  size: 20

User's prefered language

=head2 signup_datetime

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

Date and time of account creation

=head2 last_login_datetime

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

Date and time of last account login

=head2 has_login_fails

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

Number of failed logins since last successful login

=cut

__PACKAGE__->add_columns(
  "user_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "display_name",
  { data_type => "varchar", is_nullable => 1, size => 25 },
  "email",
  { data_type => "varchar", is_nullable => 1, size => 254 },
  "prefered_language",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "signup_datetime",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "last_login_datetime",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "has_login_fails",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</user_id>

=back

=cut

__PACKAGE__->set_primary_key("user_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<IDX_USERS_DISPLAYNAME>

=over 4

=item * L</display_name>

=back

=cut

__PACKAGE__->add_unique_constraint("IDX_USERS_DISPLAYNAME", ["display_name"]);

=head2 C<IDX_USERS_EMAIL>

=over 4

=item * L</email>

=back

=cut

__PACKAGE__->add_unique_constraint("IDX_USERS_EMAIL", ["email"]);

=head1 RELATIONS

=head2 news_i18ns

Type: has_many

Related object: L<App::Hannoverpm::Schema::Result::NewsI18n>

=cut

__PACKAGE__->has_many(
  "news_i18ns",
  "App::Hannoverpm::Schema::Result::NewsI18n",
  { "foreign.last_editor" => "self.user_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 users_oauths

Type: has_many

Related object: L<App::Hannoverpm::Schema::Result::UsersOauth>

=cut

__PACKAGE__->has_many(
  "users_oauths",
  "App::Hannoverpm::Schema::Result::UsersOauth",
  { "foreign.user_id" => "self.user_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 users_roles

Type: has_many

Related object: L<App::Hannoverpm::Schema::Result::UsersRole>

=cut

__PACKAGE__->has_many(
  "users_roles",
  "App::Hannoverpm::Schema::Result::UsersRole",
  { "foreign.user_id" => "self.user_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 roles

Type: many_to_many

Composing rels: L</users_roles> -> role

=cut

__PACKAGE__->many_to_many("roles", "users_roles", "role");


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-04-17 16:15:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:tCIgaHrrNyDZZn2zD6okBw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
