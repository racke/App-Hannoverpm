use utf8;
package App::Hannoverpm::Schema::Result::News;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

App::Hannoverpm::Schema::Result::News - Generic news data

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

=head1 TABLE: C<news>

=cut

__PACKAGE__->table("news");

=head1 ACCESSORS

=head2 news_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

Internal numerical news identifier

=head2 publication_datetime

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

Date and time of final publication

=head2 has_views

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

Number of views for this news

=cut

__PACKAGE__->add_columns(
  "news_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "publication_datetime",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "has_views",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</news_id>

=back

=cut

__PACKAGE__->set_primary_key("news_id");

=head1 RELATIONS

=head2 news_i18ns

Type: has_many

Related object: L<App::Hannoverpm::Schema::Result::NewsI18n>

=cut

__PACKAGE__->has_many(
  "news_i18ns",
  "App::Hannoverpm::Schema::Result::NewsI18n",
  { "foreign.news_id" => "self.news_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 news_tags

Type: has_many

Related object: L<App::Hannoverpm::Schema::Result::NewsTag>

=cut

__PACKAGE__->has_many(
  "news_tags",
  "App::Hannoverpm::Schema::Result::NewsTag",
  { "foreign.news_id" => "self.news_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 tags

Type: many_to_many

Composing rels: L</news_tags> -> tag

=cut

__PACKAGE__->many_to_many("tags", "news_tags", "tag");


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-04-17 16:15:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:gxi7linH8MJr7X6ajpTy0w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
