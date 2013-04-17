use utf8;
package App::Hannoverpm::Schema::Result::TagsLanguage;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

App::Hannoverpm::Schema::Result::TagsLanguage - Tag internationalization

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

=head1 TABLE: C<tags_languages>

=cut

__PACKAGE__->table("tags_languages");

=head1 ACCESSORS

=head2 tag_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

Internal numerical tag identifier

=head2 language_id

  data_type: 'varchar'
  is_foreign_key: 1
  is_nullable: 0
  size: 20

RFC-5646 Tags for Identifying Languages

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 25

Tag name in native language

=cut

__PACKAGE__->add_columns(
  "tag_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "language_id",
  { data_type => "varchar", is_foreign_key => 1, is_nullable => 0, size => 20 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 25 },
);

=head1 PRIMARY KEY

=over 4

=item * L</tag_id>

=item * L</language_id>

=back

=cut

__PACKAGE__->set_primary_key("tag_id", "language_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<IDX_TAGSLANGUAGES_NAMEID>

=over 4

=item * L</name>

=back

=cut

__PACKAGE__->add_unique_constraint("IDX_TAGSLANGUAGES_NAMEID", ["name"]);

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

=head2 tag

Type: belongs_to

Related object: L<App::Hannoverpm::Schema::Result::Tag>

=cut

__PACKAGE__->belongs_to(
  "tag",
  "App::Hannoverpm::Schema::Result::Tag",
  { tag_id => "tag_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-04-17 16:15:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3Ikcz6bqDkiiSfCbc/8OkQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
