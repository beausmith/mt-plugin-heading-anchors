package HeadingAnchors::Plugin;
use strict;

use MT::Util;

sub mod_heading_anchors_replace {
    # define arguments
    my ($h, $contents, $ctx) = @_;
    
    # dirify contents (using a dash) to produce heading_id
    my $heading_id = MT::Util::dirify($contents,"-");
    
    # use full entry permalink if entry/page is in context
    my $permalink = "";
    if ($ctx->stash("entry")) {
        $permalink = $ctx->_hdlr_entry_permalink({});
    }
    
    # create anchor
    my $anchor = "<a href=\"$permalink#$heading_id\" class=\"anchor\" title=\"Link to this section\"> ¶</a>";
    
    # create replacement string
    return "<h$h id=\"$heading_id\">$contents$anchor</h$h>";
}

sub mod_heading_anchors {
    # define arguments
    my ($text, $val, $ctx) = @_;
    
    # search & replace
    $text =~ s{
        <h(\d{1})>  # opening heading tag
        (.*?)       # content
        <\/h\1>     # closing heading tag
    }{
        &mod_heading_anchors_replace($1, $2, $ctx); # replacement subroutine
    }xmsgie;    # perl regex options: http://perldoc.perl.org/perlre.html
    return $text;
}

1;
