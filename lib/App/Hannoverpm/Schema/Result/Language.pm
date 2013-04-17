use utf8;
package App::Hannoverpm::Schema::Result::Language;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

App::Hannoverpm::Schema::Result::Language - Generic language keys

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

=head1 TABLE: C<languages>

=cut

__PACKAGE__->table("languages");

=head1 ACCESSORS

=head2 language_id

  data_type: 'varchar'
  is_nullable: 0
  size: 20

RFC-5646 Tags for Identifying Languages

=head2 native_name

  data_type: 'varchar'
  is_nullable: 0
  size: 70

Language name in the target native language.

=head2 english_name

  data_type: 'varchar'
  is_nullable: 0
  size: 70

Language name in the english language.

=head2 german_name

  data_type: 'varchar'
  is_nullable: 0
  size: 70

Language name in the german language.

=cut

__PACKAGE__->add_columns(
  "language_id",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "native_name",
  { data_type => "varchar", is_nullable => 0, size => 70 },
  "english_name",
  { data_type => "varchar", is_nullable => 0, size => 70 },
  "german_name",
  { data_type => "varchar", is_nullable => 0, size => 70 },
);

=head1 PRIMARY KEY

=over 4

=item * L</language_id>

=back

=cut

__PACKAGE__->set_primary_key("language_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<IDX_LANGAUGES_GERMANNAME>

=over 4

=item * L</german_name>

=back

=cut

__PACKAGE__->add_unique_constraint("IDX_LANGAUGES_GERMANNAME", ["german_name"]);

=head2 C<IDX_LANGUAGES_ENGLISHNAME>

=over 4

=item * L</english_name>

=back

=cut

__PACKAGE__->add_unique_constraint("IDX_LANGUAGES_ENGLISHNAME", ["english_name"]);

=head1 RELATIONS

=head2 news_i18ns

Type: has_many

Related object: L<App::Hannoverpm::Schema::Result::NewsI18n>

=cut

__PACKAGE__->has_many(
  "news_i18ns",
  "App::Hannoverpm::Schema::Result::NewsI18n",
  { "foreign.language_id" => "self.language_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 tags_languages

Type: has_many

Related object: L<App::Hannoverpm::Schema::Result::TagsLanguage>

=cut

__PACKAGE__->has_many(
  "tags_languages",
  "App::Hannoverpm::Schema::Result::TagsLanguage",
  { "foreign.language_id" => "self.language_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-04-17 16:15:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:GyU+CNGAlmSTvx8iuM9BuA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
