use utf8;
package App::Hannoverpm::Schema::Result::Tag;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

App::Hannoverpm::Schema::Result::Tag - Generic tag data

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

=head1 TABLE: C<tags>

=cut

__PACKAGE__->table("tags");

=head1 ACCESSORS

=head2 tag_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

Internal numerical tag identifier

=head2 has_entries

  data_type: 'mediumint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

Number of entries associated to this tag

=cut

__PACKAGE__->add_columns(
  "tag_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "has_entries",
  {
    data_type => "mediumint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</tag_id>

=back

=cut

__PACKAGE__->set_primary_key("tag_id");

=head1 RELATIONS

=head2 news_tags

Type: has_many

Related object: L<App::Hannoverpm::Schema::Result::NewsTag>

=cut

__PACKAGE__->has_many(
  "news_tags",
  "App::Hannoverpm::Schema::Result::NewsTag",
  { "foreign.tag_id" => "self.tag_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 tags_languages

Type: has_many

Related object: L<App::Hannoverpm::Schema::Result::TagsLanguage>

=cut

__PACKAGE__->has_many(
  "tags_languages",
  "App::Hannoverpm::Schema::Result::TagsLanguage",
  { "foreign.tag_id" => "self.tag_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 news

Type: many_to_many

Composing rels: L</news_tags> -> news

=cut

__PACKAGE__->many_to_many("news", "news_tags", "news");


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-04-17 16:15:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:VfVMI8G5ArkO8HL5Y8fCvQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
