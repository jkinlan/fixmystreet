use utf8;
package FixMyStreet::DB::Result::Problem;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components(
  "FilterColumn",
  "+FixMyStreet::DB::JSONBColumn",
  "FixMyStreet::InflateColumn::DateTime",
  "FixMyStreet::EncodedColumn",
);
__PACKAGE__->table("problem");
__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "problem_id_seq",
  },
  "postcode",
  { data_type => "text", is_nullable => 0 },
  "latitude",
  { data_type => "double precision", is_nullable => 0 },
  "longitude",
  { data_type => "double precision", is_nullable => 0 },
  "bodies_str",
  { data_type => "text", is_nullable => 1 },
  "bodies_missing",
  { data_type => "text", is_nullable => 1 },
  "areas",
  { data_type => "text", is_nullable => 0 },
  "category",
  { data_type => "text", default_value => "Other", is_nullable => 0 },
  "title",
  { data_type => "text", is_nullable => 0 },
  "detail",
  { data_type => "text", is_nullable => 0 },
  "photo",
  { data_type => "bytea", is_nullable => 1 },
  "used_map",
  { data_type => "boolean", is_nullable => 0 },
  "user_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "name",
  { data_type => "text", is_nullable => 0 },
  "anonymous",
  { data_type => "boolean", is_nullable => 0 },
  "external_id",
  { data_type => "text", is_nullable => 1 },
  "external_body",
  { data_type => "text", is_nullable => 1 },
  "external_team",
  { data_type => "text", is_nullable => 1 },
  "created",
  {
    data_type     => "timestamp",
    default_value => \"CURRENT_TIMESTAMP",
    is_nullable   => 0,
  },
  "confirmed",
  { data_type => "timestamp", is_nullable => 1 },
  "state",
  { data_type => "text", is_nullable => 0 },
  "lang",
  { data_type => "text", default_value => "en-gb", is_nullable => 0 },
  "service",
  { data_type => "text", default_value => "", is_nullable => 0 },
  "cobrand",
  { data_type => "text", default_value => "", is_nullable => 0 },
  "cobrand_data",
  { data_type => "text", default_value => "", is_nullable => 0 },
  "lastupdate",
  {
    data_type     => "timestamp",
    default_value => \"CURRENT_TIMESTAMP",
    is_nullable   => 0,
  },
  "whensent",
  { data_type => "timestamp", is_nullable => 1 },
  "send_questionnaire",
  { data_type => "boolean", default_value => \"true", is_nullable => 0 },
  "extra",
  { data_type => "jsonb", is_nullable => 1 },
  "flagged",
  { data_type => "boolean", default_value => \"false", is_nullable => 0 },
  "geocode",
  { data_type => "jsonb", is_nullable => 1 },
  "response_priority_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "send_state",
  { data_type => "text", default_value => "unprocessed", is_nullable => 0 },
  "send_fail_count",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "send_fail_reason",
  { data_type => "text", is_nullable => 1 },
  "send_fail_timestamp",
  { data_type => "timestamp", is_nullable => 1 },
  "send_fail_body_ids",
  {
    data_type     => "integer[]",
    default_value => \"'{}'::integer[]",
    is_nullable   => 0,
  },
  "send_method_used",
  { data_type => "text", is_nullable => 1 },
  "non_public",
  { data_type => "boolean", default_value => \"false", is_nullable => 1 },
  "external_source",
  { data_type => "text", is_nullable => 1 },
  "external_source_id",
  { data_type => "text", is_nullable => 1 },
  "interest_count",
  { data_type => "integer", default_value => 0, is_nullable => 1 },
  "subcategory",
  { data_type => "text", is_nullable => 1 },
  "defect_type_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->has_many(
  "comments",
  "FixMyStreet::DB::Result::Comment",
  { "foreign.problem_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->belongs_to(
  "defect_type",
  "FixMyStreet::DB::Result::DefectType",
  { id => "defect_type_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);
__PACKAGE__->has_many(
  "moderation_original_datas",
  "FixMyStreet::DB::Result::ModerationOriginalData",
  { "foreign.problem_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "questionnaires",
  "FixMyStreet::DB::Result::Questionnaire",
  { "foreign.problem_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->belongs_to(
  "response_priority",
  "FixMyStreet::DB::Result::ResponsePriority",
  { id => "response_priority_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);
__PACKAGE__->belongs_to(
  "user",
  "FixMyStreet::DB::Result::User",
  { id => "user_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);
__PACKAGE__->has_many(
  "user_planned_reports",
  "FixMyStreet::DB::Result::UserPlannedReport",
  { "foreign.report_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2023-06-30 10:16:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ixrwVkFgOn2KJLGaBrKRww

# Add fake relationship to stored procedure table
__PACKAGE__->has_one(
  "nearby",
  "FixMyStreet::DB::Result::Nearby",
  { "foreign.problem_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

# This will return the oldest moderation_original_data, if any.
# The plural can be used to return all entries.
__PACKAGE__->might_have(
  "moderation_original_data",
  "FixMyStreet::DB::Result::ModerationOriginalData",
  { "foreign.problem_id" => "self.id" },
  { where => { 'comment_id' => undef },
    order_by => 'id',
    rows => 1,
    cascade_copy => 0, cascade_delete => 1 },
);

# Add a possible join for the Contact object associated with
# this report (based on bodies_str and category). If the report
# was sent to multiple bodies, only returns the first.
__PACKAGE__->belongs_to(
  contact => "FixMyStreet::DB::Result::Contact",
  sub {
    my $args = shift;
    return {
        "$args->{foreign_alias}.category" => { -ident => "$args->{self_alias}.category" },
        -and => [
            \[ "CAST($args->{foreign_alias}.body_id AS text) = (regexp_split_to_array($args->{self_alias}.bodies_str, ','))[1]" ],
        ]
    };
  },
  {
    join_type => "LEFT",
    on_delete => "NO ACTION",
    on_update => "NO ACTION",
  },
);

# Add a possible join for the Contact objects associated with this report
# (based on bodies_str and category). Returns all contacts.
__PACKAGE__->has_many(
  contacts => "FixMyStreet::DB::Result::Contact",
  sub {
    my $args = shift;
    return {
        "$args->{foreign_alias}.category" => { -ident => "$args->{self_alias}.category" },
        -and => [
            \[ "CAST($args->{foreign_alias}.body_id AS text) = ANY(regexp_split_to_array($args->{self_alias}.bodies_str, ','))" ],
        ]
    };
  },
  {
    cascade_copy => 0,
    cascade_delete => 0,
    join_type => "LEFT",
  },
);

__PACKAGE__->has_many(
  confirmed_comments => "FixMyStreet::DB::Result::Comment",
  sub {
      my $args = shift;
      return {
          "$args->{foreign_alias}.problem_id" => { -ident => "$args->{self_alias}.id" },
          "$args->{foreign_alias}.state" => 'confirmed',
      };
  },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  answered_questionnaires => "FixMyStreet::DB::Result::Questionnaire",
  sub {
      my $args = shift;
      return {
          "$args->{foreign_alias}.problem_id" => { -ident => "$args->{self_alias}.id" },
          "$args->{foreign_alias}.whenanswered" => { '!=' => undef },
      };
  },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->might_have(
  contributed_by => "FixMyStreet::DB::Result::User",
  sub {
    my $args = shift;
    return
        \[ "($args->{self_alias}.extra ->> 'contributed_by')::integer = $args->{foreign_alias}.id" ];
  },
  {
    join_type => "LEFT",
    on_delete => "NO ACTION",
    on_update => "NO ACTION",
  },
);

use Moo;
use namespace::clean -except => [ 'meta' ];
use Utils;
use FixMyStreet::Geocode::Address;
use FixMyStreet::Map::FMS;
use FixMyStreet::Template;
use FixMyStreet::Template::SafeString;
use List::Util qw/any uniq/;
use LWP::Simple qw($ua);
use URI;
use URI::QueryParam;
use Digest::HMAC_SHA1 qw(hmac_sha1);
use MIME::Base64;

my $IM = eval {
    require Image::Magick;
    Image::Magick->import;
    1;
};

use constant SENDER_REGEX => qr/^.*::/;

with 'FixMyStreet::Roles::DB::Abuser',
     'FixMyStreet::Roles::DB::Extra',
     'FixMyStreet::Roles::DB::Moderation',
     'FixMyStreet::Roles::DB::Translatable',
     'FixMyStreet::Roles::DB::PhotoSet';

=head2

    @states = FixMyStreet::DB::Problem::open_states();

Get a list or states that are regarded as open. If called in
array context then returns an array of names, otherwise returns a
HASHREF.

=cut

sub open_states {
    my @states = map { $_->label } @{FixMyStreet::DB->resultset("State")->open};
    return wantarray ? @states : { map { $_ => 1 } @states };
}

=head2

    @states = FixMyStreet::DB::Problem::fixed_states();

Get a list or states that should be regarded as fixed. If called in
array context then returns an array of names, otherwise returns a
HASHREF.

=cut

sub fixed_states {
    my @states = map { $_->label } @{FixMyStreet::DB->resultset("State")->fixed};
    push @states, 'fixed - user', 'fixed - council' if @states;
    return wantarray ? @states : { map { $_ => 1 } @states };
}

=head2

    @states = FixMyStreet::DB::Problem::closed_states();

Get a list or states that should be regarded as closed. If called in
array context then returns an array of names, otherwise returns a
HASHREF.

=cut

sub closed_states {
    my @states = map { $_->label } @{FixMyStreet::DB->resultset("State")->closed};
    return wantarray ? @states : { map { $_ => 1 } @states };
}

=head2

    @states = FixMyStreet::DB::Problem::all_states();

Get a list of all states that a problem can have. If called in
array context then returns an array of names, otherwise returns a
HASHREF.

=cut

sub all_states {
    my $states = {
        'hidden'                      => 1,
        'partial'                     => 1,
        'unconfirmed'                 => 1,
        'fixed - council'             => 1,
        'fixed - user'                => 1,
    };
    map { $states->{$_->label} = 1 } @{FixMyStreet::DB->resultset("State")->states};
    return wantarray ? keys %{$states} : $states;
}

=head2

    @visible_states = FixMyStreet::DB::Problem::visible_states();
    @hidden_states  = FixMyStreet::DB::Problem::hidden_states();

Get a list of states that should be visible (or hidden) on the site. If called
in array context then returns an array of names, otherwise returns a HASHREF.

=cut

my $hidden_states = {
    'hidden' => 1,
    'partial' => 1,
    'unconfirmed' => 1,
};

sub hidden_states {
    return wantarray ? keys %{$hidden_states} : $hidden_states;
}

sub visible_states {
    my %visible_states = map {
        $hidden_states->{$_} ? () : ($_ => 1)
    } all_states();
    return wantarray ? keys %visible_states : \%visible_states;
}

sub visible_states_add {
    my ($self, @states) = @_;
    for my $state (@states) {
        delete $hidden_states->{$state};
    }
}

sub visible_states_remove {
    my ($self, @states) = @_;
    for my $state (@states) {
        $hidden_states->{$state} = 1;
    }
}

sub public_asset_id {
    my $self = shift;

    my $cobrand_for_problem = $self->body_handler;
    return unless $cobrand_for_problem;

    # Should be of the form:
    # COBRAND_FEATURES:
    #     public_asset_ids:
    #         oxfordshire: ['feature_id', 'unit_number']
    my $asset_id_labels = $cobrand_for_problem->feature('public_asset_ids');

    # Return the first match
    for my $label (@$asset_id_labels) {
        my $asset_id = $self->get_extra_field_value($label);
        return $asset_id if $asset_id;
    }
}

around service => sub {
    my ( $orig, $self ) = ( shift, shift );
    # service might be undef if e.g. unsaved code report
    my $s = $self->$orig(@_) || "";
    $s =~ s/_/ /g;
    return $s;
};

sub service_display {
    my $self = shift;
    my $service = $self->service;
    return '' if $service eq 'Open311' || $service eq 'unknown' || $service eq 'test';
    $service =~ s/PWA \((.*)\)/$1/;
    $service =~ s/PWA/mobile/; # Might as well
    return $service;
}

sub title_safe {
    my $self = shift;
    return _('Awaiting moderation') if $self->cobrand eq 'zurich' && $self->state eq 'submitted';
    return sprintf("%s problem", $self->category) if $self->cobrand eq 'tfl' && $self->result_source->schema->cobrand->moniker ne 'tfl';
    return $self->title;
}

=head2 phone_waste

The phone number for a waste report can be stored on the report, not the user,
as those reports may be instantly confirmed and we can't trust the provided
information. Returns that number if set, otherwise the user phone number.

=cut

sub phone_waste {
    my $self = shift;
    return $self->get_extra_metadata('phone') || $self->user->phone_display;
}

=head2 check_for_errors

    $error_hashref = $problem->check_for_errors();

Look at all the fields and return a hashref with all errors found, keyed on the
field name. This is intended to be passed back to the form to display the
errors.

TODO - ideally we'd pass back error codes which would be humanised in the
templates (eg: 'missing','email_not_valid', etc).

=cut

sub check_for_errors {
    my $self = shift;

    my %errors = ();

    $errors{title} = _('Please enter a subject')
      unless $self->title =~ m/\S/;

    $errors{title} = _('Please make sure you are not including an email address')
        if mySociety::EmailUtil::is_valid_email($self->title);

    $errors{detail} = _('Please enter some details')
      unless $self->detail =~ m/\S/;

    $errors{bodies} = _('No council selected')
      unless $self->bodies_str
          && $self->bodies_str =~ m/^(?:-1|[\d,]+)$/;

    if ( !$self->name || $self->name !~ m/\S/ ) {
        $errors{name} = _('Please enter your name');
    }

    return \%errors;
}

=head2 confirm

    $bool = $problem->confirm(  );
    $problem->update;


Set the state to 'confirmed' and put current time into 'confirmed' field. This
is a no-op if the report is already confirmed.

NOTE - does not update storage - call update or insert to do that.

=cut

sub confirm {
    my $self = shift;

    return if $self->state eq 'confirmed';

    $self->state('confirmed');
    $self->confirmed( \'current_timestamp' );
    return 1;
}

sub send_logged_email {
    my ($self, $h, $nomail, $cobrand) = @_;
    FixMyStreet::Email::send_cron(
        $self->result_source->schema,
        'confirm_report_sent.txt',
        $h,
        { To => $self->user->email },
        undef,
        $nomail,
        $cobrand,
        $self->lang,
    );
}

sub category_display {
    my $self = shift;
    my $contact = $self->contact;
    return $self->category unless $contact; # Fallback; shouldn't happen, but some tests
    return $contact->category_display;
}

sub bodies_str_ids {
    my $self = shift;
    return [] unless $self->bodies_str;
    my @bodies = split( /,/, $self->bodies_str );
    return \@bodies;
}

=head2 bodies

Returns a hashref of bodies to which a report was sent.

=cut

has bodies => (
    is => 'ro',
    lazy => 1,
    default => sub {
        my $self = shift;
        return {} unless $self->bodies_str;
        my $cache = $self->result_source->schema->cache;
        return $cache->{bodies}{$self->bodies_str} if $cache->{bodies}{$self->bodies_str};

        my $bodies = $self->bodies_str_ids;
        my @bodies = $self->result_source->schema->resultset('Body')->search(
            { id => $bodies },
            { prefetch => 'body_areas' },
        )->all;
        $cache->{bodies}{$self->bodies_str} = { map { $_->id => $_ } @bodies };
        return $cache->{bodies}{$self->bodies_str};
    },
);

sub body_names($) {
    my $self = shift;
    my $bodies = $self->bodies;
    my @names = map { $_->name } values %$bodies;
    return \@names;
}

sub to_body_named($$) {
    my ($self, $re) = @_;
    my $names = join(',,', @{$self->body_names});
    $names =~ /$re/;
}

=head2 url

Returns a URL for this problem report.

=cut

sub url {
    my $self = shift;
    return "/report/" . $self->id;
}

sub admin_url {
    my ($self, $cobrand) = @_;
    return $cobrand->admin_base_url . '/report_edit/' . $self->id;
}

=head2 tokenised_url

Return a url for this problem report that logs a user in

=cut

sub tokenised_url {
    my ($self, $user, $params) = @_;

    my %params;
    if ($user->email_verified) {
        $params{email} = $user->email;
    } elsif ($user->phone_verified) {
        $params{phone} = $user->phone;
        # This is so the email token can look up/ log in a phone user
        $params{login_type} = 'phone';
    }

    my $token = FixMyStreet::DB->resultset('Token')->create(
        {
            scope => 'email_sign_in',
            data  => {
                %params,
                id    => $self->id,
                r     => $self->url,
                p     => $params,
            }
        }
    );

    return "/M/". $token->token;
}

has view_token => (
    is => 'ro',
    lazy => 1,
    default => sub {
        my $self = shift;
        my $token = FixMyStreet::DB->resultset('Token')->create({
            scope => 'alert_to_reporter',
            data => { id => $self->id }
        });
    },
);

=head2 view_url

Return a url for this problem report that will always show it
(even if e.g. a private report) but does not log the user in.

=cut

sub view_url {
    my $self = shift;
    return $self->url unless $self->non_public;
    return "/R/" . $self->view_token->token;
}

=head2 confirmation_url

Return a URL for this problem report that shows the confirmation page
with the correct token in the URL parameter.

=cut

sub confirmation_url {
    my ($self, $c) = @_;
    return $c->uri_for_action( '/report/confirmation', [ $self->id ] ) . "?token=" . $self->confirmation_token;
}

=head2 is_hidden

Returns 1 if the problem is in an hidden state otherwise 0.

=cut

sub is_hidden {
    my $self = shift;

    return exists $self->hidden_states->{ $self->state } ? 1 : 0;
}

=head2 is_open

Returns 1 if the problem is in a open state otherwise 0.

=cut

sub is_open {
    my $self = shift;

    return exists $self->open_states->{ $self->state } ? 1 : 0;
}

=head2 is_in_progress

Sees if the problem is in an open, not 'confirmed' state.

=cut

sub is_in_progress {
    my $self = shift;
    return $self->is_open && $self->state ne 'confirmed' ? 1 : 0;
}

=head2 is_fixed

Returns 1 if the problem is in a fixed state otherwise 0.

=cut

sub is_fixed {
    my $self = shift;

    return exists $self->fixed_states->{ $self->state } ? 1 : 0;
}

=head2 is_closed

Returns 1 if the problem is in a closed state otherwise 0.

=cut

sub is_closed {
    my $self = shift;

    return exists $self->closed_states->{ $self->state } ? 1 : 0;
}

=head2 is_visible

Returns 1 if the problem should be displayed on the site otherwise 0.

=cut

sub is_visible {
    my $self = shift;

    return exists $self->visible_states->{ $self->state } ? 1 : 0;
}

=head2 meta_line

Returns a string to be used on a problem report page, describing some of the
meta data about the report.

=cut

sub meta_line {
    my ( $problem, $user ) = @_;
    my $cobrand = $problem->result_source->schema->cobrand;

    my $date_time = Utils::prettify_dt( $problem->confirmed );
    my $meta = '';

    my $category = $problem->category_display;
    $category = $cobrand->call_hook(change_category_text => $category) || $category;

    # Call a hook on the cobrand to check if the problem should be treated as anonymous
    my $anonymous = $cobrand->call_hook('is_problem_anonymous');

    if ( $problem->anonymous || $anonymous ) {
        if ( $problem->service_display && $category && $category ne _('Other') ) {
            $meta =
            sprintf( _('Reported via %s in the %s category anonymously at %s'),
                $problem->service_display, $category, $date_time );
        } elsif ( $problem->service_display ) {
            $meta = sprintf( _('Reported via %s anonymously at %s'),
                $problem->service_display, $date_time );
        } elsif ( $category and $category ne _('Other') ) {
            $meta = sprintf( _('Reported in the %s category anonymously at %s'),
                $category, $date_time );
        } else {
            $meta = sprintf( _('Reported anonymously at %s'), $date_time );
        }
    } else {
        my $problem_name = $problem->name;

        if ($user and
            $user->has_permission_to('view_body_contribute_details', $problem->bodies_str_ids) and
            $problem->name ne $problem->user->name) {
            $problem_name = sprintf('%s (%s)', $problem->name, $problem->user->name );
        }

        if ( $problem->service_display && $category && $category ne _('Other') ) {
            $meta = sprintf(
                _('Reported via %s in the %s category by %s at %s'),
                $problem->service_display, $category,
                $problem_name,    $date_time
            );
        } elsif ( $problem->service_display ) {
            $meta = sprintf( _('Reported via %s by %s at %s'),
                $problem->service_display, $problem_name, $date_time );
        } elsif ( $category and $category ne _('Other') ) {
            $meta = sprintf( _('Reported in the %s category by %s at %s'),
                $category, $problem_name, $date_time );
        } else {
            $meta = sprintf( _('Reported by %s at %s'), $problem_name, $date_time );
        }
    }

    return $meta;
}

sub nearest_address {
    my ($self, $include_waste) = @_;
    return '' if !$include_waste && $self->cobrand_data && $self->cobrand_data eq 'waste';
    return FixMyStreet::Geocode::Address->new($self->geocode)->summary;
}

sub nearest_address_parts {
    my $self = shift;
    return FixMyStreet::Geocode::Address->new($self->geocode)->parts;
}

# Does not return bodies whose send methods have failed
sub body {
    my ( $problem, $link ) = @_;
    my $body;
    if ($problem->external_body) {
        if ($problem->cobrand eq 'zurich') {
            my $cache = $problem->result_source->schema->cache;
            return $cache->{bodies}{$problem->external_body} //= FixMyStreet::DB->resultset('Body')->find({ id => $problem->external_body });
        } else {
            $body = FixMyStreet::Template::html_filter($problem->external_body);
        }
    } else {
        my %bodies = %{$problem->bodies};

        # We only want bodies with successful send methods (in the case of
        # a problem that has multiple send methods), so remove failed
        delete $bodies{$_} for @{ $problem->send_fail_body_ids // [] };

        my @body_names = sort map {
            my $name = $_->name;
            if ($link and FixMyStreet->config('AREA_LINKS_FROM_PROBLEMS')) {
                '<a href="' . $_->url . '">' . FixMyStreet::Template::html_filter($name) . '</a>';
            } else {
                FixMyStreet::Template::html_filter($name);
            }
        } values %bodies;
        if ( scalar @body_names > 2 ) {
            $body = join( ', ', splice @body_names, 0, -1);
            $body = join( ',' . _(' and '), ($body, $body_names[-1]));
        } else {
            $body = join( _(' and '), @body_names);
        }
    }
    return FixMyStreet::Template::SafeString->new($body);
}


=head2 time_ago
  Returns how long ago a problem was reported in an appropriately
  prettified duration, depending on the duration.
=cut

sub time_ago {
    my ( $self, $date ) = @_;
    $date ||= 'confirmed';
    my $duration = time() - $self->$date->epoch;

    return Utils::prettify_duration( $duration );
}

=head2 days_ago

  Returns how many days ago a problem was reported.

=cut

sub days_ago {
    my ( $self, $date ) = @_;
    $date ||= 'confirmed';
    my $now = DateTime->now( time_zone => FixMyStreet->time_zone || FixMyStreet->local_time_zone );
    my $duration = $now->delta_days($self->$date);
    return $duration->delta_days;
}

=head2 response_templates

Returns all ResponseTemplates attached to this problem's bodies, in alphabetical
order of title.

=cut

sub response_templates {
    my $self = shift;
    return $self->result_source->schema->resultset('ResponseTemplate')->search(
        {
            'me.body_id' => $self->bodies_str_ids,
            'contact.category' => [ $self->category, undef ],
        },
        {
            order_by => 'title',
            join => { 'contact_response_templates' => 'contact' },
        }
    );
}

sub response_template_for {
    my ($self, $state, $old_state, $ext_code, $old_ext_code) = @_;

    # Response templates are only triggered if the state/external status has changed.
    # And treat any fixed state as fixed.
    my $state_changed = $state ne $old_state
        && !( $self->is_fixed && FixMyStreet::DB::Result::Problem->fixed_states()->{$state} );
    my $ext_code_changed = $ext_code && $ext_code ne $old_ext_code;
    my $template;
    if ($state_changed || $ext_code_changed) {
        # make sure that empty string/nulls come last, and templates for a category come earlier.
        my $order = { order_by => \"me.external_status_code DESC NULLS LAST, contact.category" };
        my $state_params = [];
        if ($state_changed) {
            push @$state_params, { 'me.state' => $state, 'me.external_status_code' => ["", undef] };
        }
        if ($ext_code_changed) {
            # The double comma option here dates from Echo updates with only a
            # resolution code ID being stored in the database as "CODE,,". Once
            # they're all updated to only be CODE, this can be removed.
            push @$state_params, { 'me.state' => '', 'me.external_status_code' => [$ext_code, "$ext_code,,"] };
        };

        $template = $self->response_templates->search({
            auto_response => 1,
            -or => $state_params,
        }, $order )->first;
    }
    return $template;
}

=head2 response_priorities

Returns all ResponsePriorities attached to this problem's category/contact, in
alphabetical order of name.

=cut

sub response_priorities {
    my $self = shift;
    my $rs = $self->result_source->schema->resultset('ResponsePriority')->for_bodies($self->bodies_str_ids, $self->category);
    $rs->search([
        'me.deleted' => 0,
        'me.id' => $self->response_priority_id,
    ]);
}

=head2 defect_types

Returns all DefectTypes attached to this problem's category/contact, in
alphabetical order of name.

=cut

sub defect_types {
    my $self = shift;
    return $self->result_source->schema->resultset('DefectType')->for_bodies($self->bodies_str_ids, $self->category);
}

=head2 can_display_external_id

Returns true if the external id is the council's ref, i.e., useful to publish
it (by way of an example, the Open311 send method returns a useful reference
when it succeeds, so that is the ref we should show on the problem report
page).
Future: this is installation-dependent so maybe should be using the contact
data to determine if the external id is public on a council-by-council basis.
Note: this only makes sense when called on a problem that has been sent!

=cut

sub can_display_external_id {
    my $self = shift;
    if ( $self->external_id && $self->to_body_named('Aberdeenshire|Lincolnshire|Isle of Wight|East Sussex|Central Bedfordshire|Shropshire|Merton') ) {
        return 1;
    }
    return 0;
}

# This can return HTML and is safe, so returns a FixMyStreet::Template::SafeString
sub duration_string {
    my $problem = shift;
    my $cobrand = $problem->result_source->schema->cobrand;
    my $body = $cobrand->call_hook( link_to_council_cobrand => $problem )
        || $problem->body(1);
    return
        unless $problem->whensent
        && $problem->service ne 'Open311';
    my $s = sprintf(_('Sent to %s %s later'), $body,
        Utils::prettify_duration($problem->whensent->epoch - $problem->confirmed->epoch, 'minute')
    );
    return FixMyStreet::Template::SafeString->new($s);
}

sub local_coords {
    my $self = shift;
    my $cobrand = $self->get_cobrand_logged;
    if ($cobrand->moniker eq 'zurich') {
        my ($x, $y) = Geo::Coordinates::CH1903Plus::from_latlon($self->latitude, $self->longitude);
        return ( int($x+0.5), int($y+0.5) );
    } elsif ($cobrand->country eq 'GB') {
        my $coordsyst = 'G';
        $coordsyst = 'I' if FixMyStreet::Map::FMS->new(
            latitude => $self->latitude,
            longitude => $self->longitude,
        )->in_northern_ireland_box;
        my ($x, $y) = Utils::convert_latlon_to_en( $self->latitude, $self->longitude, $coordsyst );
        return ($x, $y, $coordsyst);
    }
}

sub update_send_failed {
    my $self = shift;
    my $msg  = shift;

    $self->update( {
        send_fail_count => $self->send_fail_count + 1,
        send_fail_timestamp => \'current_timestamp',
        send_fail_reason => $msg
    } );
}

=head2 updates_sent_to_body

Returns 1 if updates left on this report will be sent to any of the receiving
bodies by some mechanism. Right now that mechanism is Open311.

=cut

sub updates_sent_to_body {
    my $self = shift;

    return 1 if $self->to_body_named('TfL');
    return unless $self->send_method_used && $self->send_method_used =~ /Open311/;

    # Some bodies only send updates *to* FMS, they don't receive updates.
    my $handler = $self->body_handler;
    my $ret = $handler && $handler->call_hook(updates_sent_to_body => $self);
    return $ret if defined $ret;

    my @bodies = values %{ $self->bodies };
    my @updates_sent = grep {
        $_->send_comments &&
        (
            $_->send_method eq 'Open311' ||
            $_->send_method eq 'Noop' # Sending might be temporarily disabled
        )
    } @bodies;
    return scalar @updates_sent;
}

sub add_send_method {
    my $self   = shift;
    my $sender = shift;
    $sender =~ s/${\SENDER_REGEX}//;

    if ( my $existing_send_method = $self->send_method_used ) {
        $self->send_method_used("$existing_send_method,$sender");
    }
    else {
        $self->send_method_used($sender);
    }
}

sub add_send_fail_body_ids {
    my $self    = shift;
    my @new_ids = @_;

    $self->send_fail_body_ids(
        [   sort { $a <=> $b }
                uniq( @new_ids, @{ $self->send_fail_body_ids } )
        ]
    );
}

sub remove_send_fail_body_ids {
    my $self       = shift;
    my @remove_ids = @_;

    my %existing_ids = map { $_ => 1 } @{ $self->send_fail_body_ids };

    delete @existing_ids{@remove_ids};

    $self->send_fail_body_ids( [ sort { $a <=> $b } keys %existing_ids ] );
}

sub has_given_send_fail_body_id {
    my $self = shift;
    my $id   = shift;

    return any { $_ == $id } @{ $self->send_fail_body_ids };
}

sub send_fail_bodies {
    my $self = shift;

    my $bodies = $self->bodies;

    my @send_fail_bodies;

    for (@{$self->send_fail_body_ids}) {
        my $body = $bodies->{$_};
        push @send_fail_bodies, $body->name;
    }

    return \@send_fail_bodies;
}

sub mark_as_sent {
    my $self = shift;
    $self->whensent( \'current_timestamp' );
    $self->send_state('sent');
    $self->send_fail_body_ids( [] );
}

sub resend {
    my $self = shift;

    # Store old sent time and external ID, if present
    if ($self->whensent) {
        my $previous = $self->get_extra_metadata('whensent_previous', []);
        my $sent_to = $self->get_extra_metadata('sent_to');
        push @$previous, {
            whensent => $self->whensent->iso8601,
            $self->external_id ? (external_id => $self->external_id) : (),
            $self->send_method_used ? (send_method_used => $self->send_method_used) : (),
            $sent_to ? (sent_to => $sent_to) : (),
        };
        $self->set_extra_metadata(whensent_previous => $previous);
    }

    $self->whensent(undef);
    $self->send_method_used(undef);
    $self->send_fail_body_ids([]);
    $self->send_state('unprocessed');
}

sub as_hashref {
    my ($self, $cols) = @_;
    my $cobrand = $self->result_source->schema->cobrand;

    my $state_t = FixMyStreet::DB->resultset("State")->display($self->state, 0, $cobrand->moniker);

    my $out = {
        id        => $self->id,
        title     => $self->title,
        category  => $self->category,
        detail    => $self->detail,
        latitude  => $self->latitude,
        longitude => $self->longitude,
        postcode  => $self->postcode,
        areas     => $self->areas,
        state     => $self->state,
        state_t   => $state_t,
        used_map  => $self->used_map,
        created   => $self->created,
    };
    $out->{is_fixed} = $self->fixed_states->{ $self->state } ? 1 : 0 if !$cols || $cols->{is_fixed};
    $out->{photos} = [ map { $_->{url} } @{$self->photos} ] if !$cols || $cols->{photos};
    $out->{meta} = $self->confirmed ? $self->meta_line : '' if !$cols || $cols->{meta};
    $out->{created_pp} = $cobrand->prettify_dt( $self->created ) if !$cols || $cols->{created_pp};
    if ($self->confirmed) {
        $out->{confirmed} = $self->confirmed if !$cols || $cols->{confirmed};
        $out->{confirmed_pp} = $cobrand->prettify_dt( $self->confirmed ) if !$cols || $cols->{confirmed_pp};
    }
    return $out;
}

__PACKAGE__->has_many(
  "admin_log_entries",
  "FixMyStreet::DB::Result::AdminLog",
  { "foreign.object_id" => "self.id" },
  {
      cascade_copy => 0, cascade_delete => 0,
      where => { 'object_type' => 'problem' },
  }
);

sub moderation_filter {
    my $self = shift;
    { comment_id => undef };
}

sub get_time_spent {
    my $self = shift;
    my $admin_logs = $self->admin_log_entries->search({},
        {
            group_by => 'object_id',
            columns => [
                { sum_time_spent => { sum => 'time_spent' } },
            ]
        })->single;
    return $admin_logs ? $admin_logs->get_column('sum_time_spent') : 0;
}

=head2 get_cobrand_logged

Get a cobrand object for the cobrand the problem was logged for.

e.g. if a problem was logged at www.fixmystreet.com, this will be a
FixMyStreet::Cobrand::FixMyStreet object.

=cut

has get_cobrand_logged => (
    is => 'ro',
    lazy => 1,
    default => sub {
        my $self = shift;
        my $cobrand_class = FixMyStreet::Cobrand->get_class_for_moniker( $self->cobrand );
        return $cobrand_class->new;
    },
);

=head2 body_handler

Calls the get_body_handler_for_problem hook on the cobrand the report was logged against.
In the UK, this returns the corresponding cobrand for the body a report was sent to, and
on fixmystreet.com it returns Buckinghamshire for Bucks parish bodies, and FixMyStreet for
Kingston/Sutton reports (rather than themselves, as they are only waste).

=cut

has body_handler => (
    is => 'ro',
    lazy => 1,
    default => sub {
        my $self = shift;
        my $cobrand = $self->get_cobrand_logged;
        my $handler = $cobrand->call_hook(get_body_handler_for_problem => $self);
        return $handler;
    },
);

sub cobrand_name_for_state {
    my ($self, $cobrand) = @_;
    my $cobrand_name = $cobrand->moniker;
    my $names = join(',,', @{$self->body_names});
    if ($names =~ /(Bromley|Isle of Wight|Oxfordshire|TfL)/) {
        ($cobrand_name = lc $1) =~ s/ //g;
    }
    return $cobrand_name;
}

sub pin_data {
    my ($self, $page, %opts) = @_;
    my $cobrand = $self->result_source->schema->cobrand;
    my $colour = $cobrand->pin_colour($self, $page);
    my $title = $opts{private} ? $self->title : $self->title_safe;
    $title = $cobrand->call_hook(pin_hover_title => $self, $title) || $title;
    {
        latitude => $self->latitude,
        longitude => $self->longitude,
        colour => $colour,
        id => $self->id,
        title => $title,
        problem => $self,
        draggable => $opts{draggable},
        type => $opts{type},
        base_url => $cobrand->relative_url_for_report($self),
    }
};

sub static_map {
    my ($self, %params) = @_;

    return unless $IM;

    my $orig_map_class = FixMyStreet::Map::set_map_class('OSM')
        unless $FixMyStreet::Map::map_class->isa("FixMyStreet::Map::OSM");

    my $cobrand = $FixMyStreet::Map::map_cobrand || $self->get_cobrand_logged;
    my $map = $FixMyStreet::Map::map_class->new({
        latitude  => $self->latitude,
        longitude => $self->longitude,
        cobrand => $cobrand,
        distance => 1, # prevents the call to Gaze which isn't necessary
        $params{zoom} ? ( zoom => $params{zoom} ) : (),
    });
    my $map_data = $map->generate_map_data(
        latitude  => $self->latitude,
        longitude => $self->longitude,
        pins      => $self->used_map
        ? [ {
            latitude  => $self->latitude,
            longitude => $self->longitude,
            colour    => $cobrand->pin_colour($self, 'report'),
            type      => 'big',
          } ]
        : [],
    );

    $ua->agent("FixMyStreet/1.0");
    my $image;
    for (my $i=0; $i<4; $i++) {
        my $tile_url = $map_data->{tiles}->[$i];
        if ($tile_url =~ m{^//}) {
            $tile_url = "https:$tile_url";
        }
        my $tile;
        if (FixMyStreet->test_mode) {
            $tile = FixMyStreet->path_to('t/app/controller/sample.jpg')->slurp(iomode => '<:raw');
        } else {
            $tile = LWP::Simple::get($tile_url);
        }
        next unless $tile;
        my $im = Image::Magick->new;
        $im->BlobToImage($tile);
        my $gravity = ($i<2?'North':'South') . ($i%2?'East':'West');
        if (!$image) {
            $image = $im;
            $image->Extent(geometry => '512x512', gravity => $gravity);
        } else {
            $image->Composite(image => $im, gravity => $gravity);
        }
    }

    unless ($image) {
        FixMyStreet::Map::set_map_class($orig_map_class) if $orig_map_class;
        return;
    }

    # The only pin might be the report pin, with added x/y
    my $pin = $map_data->{pins}->[0];
    if ($pin) {
        my $im = Image::Magick->new;
        $im->read(FixMyStreet->path_to('web', 'i', 'pins/yellow/pin.png'));
        $im->Scale( geometry => '48x64' );
        $image->Composite(image => $im, gravity => 'NorthWest',
            x => $pin->{px} - 24, y => $pin->{py} - 64);
    }

    unless ( $params{skip_crop} ) {
        # Bottom 128/ top 64 pixels will never have a pin
        $image->Extent( geometry => '512x384', gravity => 'NorthWest');
        $image->Extent( geometry => '512x320', gravity => 'SouthWest');
    }

    $image->Scale( geometry => "310x200>" ) unless $params{full_size};

    my @blobs = $image->ImageToBlob(magick => 'jpeg');
    undef $image;

    FixMyStreet::Map::set_map_class($orig_map_class) if $orig_map_class;

    return {
        data => $blobs[0],
        content_type => 'image/jpeg',
    };
}

has shortlisted_user => (
    is => 'ro',
    lazy => 1,
    default => sub {
        my $self = shift;
        my $user = $self->user_planned_reports->active->first;
        return $user->user if $user;
    },
);

sub set_duplicate_of {
    my ($self, $other_id) = @_;
    $self->set_extra_metadata( duplicate_of => $other_id );
    my $dupe = $self->result_source->schema->resultset("Problem")->find($other_id);
    my $dupes_duplicates = $dupe->get_extra_metadata('duplicates') || [];
    push @$dupes_duplicates, $self->id;
    $dupe->set_extra_metadata( duplicates => $dupes_duplicates );
    $dupe->update;
}

has duplicate_of => (
    is => 'ro',
    lazy => 1,
    default => sub {
        my $self = shift;
        return unless $self->state eq 'duplicate';
        my $duplicate_of = int($self->get_extra_metadata("duplicate_of") || 0);
        return unless $duplicate_of;
        return $self->result_source->schema->resultset('Problem')->search({ id => $duplicate_of })->first;
    },
);

has duplicates => (
    is => 'ro',
    lazy => 1,
    default => sub {
        my $self = shift;
        my $duplicates = $self->get_extra_metadata("duplicates") || [];
        return [] unless $duplicates && @$duplicates;
        my @duplicates = $self->result_source->schema->resultset('Problem')->search({ id => $duplicates })->all;
        return \@duplicates;
    },
);

has inspection_log_entry => (
    is => 'ro',
    lazy => 1,
    default => sub {
        my $self = shift;
        return $self->admin_log_entries->search({ action => 'inspected' })->order_by('-whenedited')->first;
    },
);

has alerts => (
    is => 'ro',
    lazy => 1,
    default => sub {
        my $self = shift;
        return $self->result_source->schema->resultset('Alert')->search({
            alert_type => 'new_updates', parameter => $self->id
        });
    },
);

has comment_count => (
    is => 'ro',
    lazy => 1,
    default => sub {
        my $self = shift;
        $self->comments->count;
    },
);

=item cancel_update_alert

Takes a comment id as a mandatory argument and will suppress
alerts being sent out for that comment when
FixMyStreet::Script::Alerts::send_updates is run.

Optionally adding user_id argument will restrict the suppression
to only alerts for that user ID.

=cut

sub cancel_update_alert {
    my ($self, $comment_id, $user_id) = @_;

    my $cfg = {
        alert_type => 'new_updates',
        parameter  => $self->id,
        confirmed  => 1,
    };
    $cfg->{user_id} = $user_id if $user_id;

    my @alerts = FixMyStreet::DB->resultset('Alert')->search( $cfg );

    for my $alert (@alerts) {
        FixMyStreet::DB->resultset('AlertSent')->find_or_create( {
            alert_id  => $alert->id,
            parameter => $comment_id,
        } );
    }
};

sub confirmation_token {
    my $self = shift;

    if (!$self->created) {
        # Might be an old handle on the DB row, so reload it
        $self = FixMyStreet::DB->resultset('Problem')->find({ id => $self->id });
    }
    my $time = $self->created->epoch;
    my $hash = hmac_sha1("$time-" . $self->id, FixMyStreet::DB->resultset('Secret')->get);
    $hash = encode_base64($hash, "");
    $hash =~ s/\W//g; # don't want + / = in URL params
    return $hash;
}

sub create_related_things {
    my ($self, $no_reporter_alert) = @_;

    # Set up a reporter alert
    unless ($no_reporter_alert || $self->get_cobrand_logged->call_hook('suppress_reporter_alerts', $self)) {
        FixMyStreet::DB->resultset("Alert")->find_or_create( {
            user         => $self->user,
            alert_type   => 'new_updates',
            parameter    => $self->id,
            cobrand      => $self->cobrand,
            cobrand_data => $self->cobrand_data,
            lang         => $self->lang,
        } )->confirm;
    }

    # If there is a special template, create a comment using that
    foreach my $body (values %{$self->bodies}) {
        my $user = $body->comment_user or next;

        my $updates = Open311::GetServiceRequestUpdates->new(
            blank_updates_permitted => 1,
        );

        my $template = $self->response_template_for('confirmed', 'dummy', '', '');
        my ($description, $email_text) = $updates->comment_text_for_request($template, {}, $self);
        next unless $description;

        $self->add_to_comments({
            user => $user,
            external_id => 'auto-internal',
            send_state => 'processed',
            text => $description,
            private_email_text => $email_text,
            problem_state => 'confirmed',
            state => 'unconfirmed',
            confirmed => \'current_timestamp', # So that it will always be first
        });
    }
}

=head2 Waste related activity

=head3 waste_property_id

Return the property ID used in the URL of a bin day page. This is usually
property_id on the report, but could be the UPRN (e.g. Bexley).

=cut

sub waste_property_id {
    my $self = shift;
    return $self->get_extra_field_value('uprn') if $self->cobrand eq 'bexley';
    return $self->get_extra_field_value('property_id');
}

=head3 waste_check_payment

This is called to see if a report has already had payment made on it.

=cut

sub waste_check_payment_state {
    my ($self, $reference) = @_;
    my $cobrand = $self->get_cobrand_logged;

    my $already_confirmed;
    if ($self->category eq 'Bulky collection' || $self->category eq 'Small items collection') {
        $already_confirmed = $cobrand->bulky_send_before_payment;
    }

    return 1 unless $self->state eq 'unconfirmed' || $already_confirmed;
    return 1 if $already_confirmed && $self->get_extra_metadata('payment_reference');
    return 0;
}

=head3 waste_confirm_payment

This is called when a payment has been confirmed in order to record the
payment, perhaps send an email, add a payment confirmation update for
already-sent bulky collections, cancel a previous collection if an amendment,
and so on.

=cut

sub waste_confirm_payment {
    my ($self, $reference) = @_;
    my $cobrand = $self->get_cobrand_logged;

    return if $self->waste_check_payment_state;

    my $already_confirmed;
    if ($self->category eq 'Bulky collection' || $self->category eq 'Small items collection') {
        $already_confirmed = $cobrand->bulky_send_before_payment;
    }

    my $rs = $self->result_source->schema->resultset('Problem');
    my $db = $self->result_source->storage;
    my $no_reporter_alert = ($self->get_extra_metadata('contributed_as') || '') eq 'anonymous_user';

    my @problems = ($self);
    if (my $grouped_ids = $self->get_extra_metadata('grouped_ids')) {
        foreach my $id (@$grouped_ids) {
            my $problem = $rs->find({ id => $id }) or next;
            push @problems, $problem;
        }
    }

    if ($cobrand->suppress_report_sent_email($self)) {
        # Send bulky confirmation email after report confirmation (see
        # the suppress_report_sent_email for SLWP)
        $self->send_logged_email({ report => $self, cobrand => $cobrand }, 0, $cobrand);
    }

    foreach my $p (@problems) {
        $db->txn_do(sub {
            $p = $rs->search({ id => $p->id }, { for => \'UPDATE' })->single;
            $p->update_extra_field( {
                name => 'LastPayMethod',
                description => 'LastPayMethod',
                value => $cobrand->bin_payment_types->{$p->get_extra_field_value('payment_method')}
            }) if $p->get_extra_field_value('payment_method');
            $p->update_extra_field( {
                name => 'PaymentCode',
                description => 'PaymentCode',
                value => $reference
            }) if $reference;
            $p->set_extra_metadata('payment_reference', $reference) if $reference;
            $p->confirm;
            $p->create_related_things($no_reporter_alert);
            $p->update;
        });
    }

    if ($already_confirmed) {
        $self->discard_changes;
        $self->bulky_add_payment_confirmation_update($reference);
    }

    if (my $previous = $self->get_extra_metadata('previous_booking_id')) {
        $previous = $rs->find($previous);
        $previous->bulky_cancel_collection('amendment');
        my $update = $cobrand->bulky_is_cancelled($previous, 'unconfirmed');
        $update->confirm;
        $update->update;
    }
}

sub bulky_add_payment_confirmation_update {
    my ($self, $reference) = @_;
    my $cobrand = $self->get_cobrand_logged;

    my $payment = $self->get_extra_field_value('payment') || 0;
    $payment = sprintf( '%.2f', $payment / 100 );
    my $reference_text = 'reference ';
    if (!$reference) {
        $reference_text .= $self->get_extra_metadata('chequeReference') . ' (phone/cheque)';
    } else {
        $reference_text .= $reference;
    }
    my $payments = $cobrand->get_all_payments($self);
    $payments = join('|', map { "$_->{ref}|$_->{amount}" } @$payments);
    my $comment = $self->add_to_comments({
        text => "Payment confirmed, $reference_text, amount £$payment",
        user => $cobrand->body->comment_user || $self->user,
        extra => {
            fms_extra_payments => $payments,
        }
    });
    $self->cancel_update_alert($comment->id);
}

sub bulky_cancel_collection {
    my ($self, $type, $non_user_cancel) = @_;

    $self->state('cancelled');
    my $description = $non_user_cancel
        ? "Cancelled" : $type eq 'amendment' ? 'Cancelled due to amendment' : "Cancelled at user request";
    $self->detail($self->detail . " | " . $description);
    $self->update;
}

1;
