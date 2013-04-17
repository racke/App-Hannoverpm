use utf8;
package App::Hannoverpm::Schema::Result::NewsI18n;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

App::Hannoverpm::Schema::Result::NewsI18n - News internationalization

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

=head1 TABLE: C<news_i18n>

=cut

__PACKAGE__->table("news_i18n");

=head1 ACCESSORS

=head2 news_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

Internal numerical news identifier

=head2 language_id

  data_type: 'varchar'
  is_foreign_key: 1
  is_nullable: 0
  size: 20

RFC-5646 Tags for Identifying Languages

=head2 subject

  data_type: 'varchar'
  is_nullable: 0
  size: 70

Plain subject in native language

=head2 abstract

  data_type: 'varchar'
  is_nullable: 0
  size: 150

Plain abstract in native language

=head2 message

  data_type: 'mediumtext'
  is_nullable: 0

Markdown message in native language

=head2 has_edits

  data_type: 'smallint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

Number of edits for this specific news internationalization

=head2 last_edit_datetime

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

Date and time of last edit for this specific news internationalization

=head2 last_editor

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

Last editor (user_id) for this specific news internationalization

=cut

__PACKAGE__->add_columns(
  "news_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "language_id",
  { data_type => "varchar", is_foreign_key => 1, is_nullable => 0, size => 20 },
  "subject",
  { data_type => "varchar", is_nullable => 0, size => 70 },
  "abstract",
  { data_type => "varchar", is_nullable => 0, size => 150 },
  "message",
  { data_type => "mediumtext", is_nullable => 0 },
  "has_edits",
  {
    data_type => "smallint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "last_edit_datetime",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "last_editor",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</news_id>

=item * L</language_id>

=back

=cut

__PACKAGE__->set_primary_key("news_id", "language_id");

=head1 RELATIONS

=head2 language

Type: belongs_to

Related object: L<App::Hannoverpm::Schema::Result::Language>

=cut

__PACKAGE__->belongs_to(
  "language",
  "App::Hannoverpm::Schema::Result::Language",
  { language_id => "language_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 last_editor

Type: belongs_to

Related object: L<App::Hannoverpm::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "last_editor",
  "App::Hannoverpm::Schema::Result::User",
  { user_id => "last_editor" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 news

Type: belongs_to

Related object: L<App::Hannoverpm::Schema::Result::News>

=cut

__PACKAGE__->belongs_to(
  "news",
  "App::Hannoverpm::Schema::Result::News",
  { news_id => "news_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-04-17 16:15:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zFS1uxAVXDqUyn/XqxvyqA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
