use utf8;
package App::Hannoverpm::Schema::Result::NewsTag;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

App::Hannoverpm::Schema::Result::NewsTag - News has tags

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

=head1 TABLE: C<news_tags>

=cut

__PACKAGE__->table("news_tags");

=head1 ACCESSORS

=head2 news_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

Internal numerical news identifier

=head2 tag_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

Internal numerical tag identifier

=cut

__PACKAGE__->add_columns(
  "news_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "tag_id",
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

=item * L</tag_id>

=back

=cut

__PACKAGE__->set_primary_key("news_id", "tag_id");

=head1 RELATIONS

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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:QSLzrDuv6ewzQu4xDUk1qQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
