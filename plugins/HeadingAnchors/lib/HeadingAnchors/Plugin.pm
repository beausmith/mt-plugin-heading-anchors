package HeadingAnchors::Plugin;
use strict;

use MT::Util;

sub mod_heading_anchors_replace {
    # define arguments
    my ($h, $contents) = @_;
    
    # dirify contents to produce heading_id
    my $heading_id = MT::Util::dirify($contents);
    
    # create anchor
    my $anchor = "<a href=\"#$heading_id\" class=\"anchor\" title=\"Link to this section\"> ¶</a>";
    
    # create replacement string
    return "<h$h id=\"$heading_id\">$contents$anchor</h$h>";
}

sub mod_heading_anchors {
    # define arguments
    my ($text) = @_;
    
    # search & replace
    $text =~ s{
        <h(\d{1})>  # opening heading tag
        (.*?)       # content
        <\/h\1>     # closing heading tag
    }{
        &mod_heading_anchors_replace($1,$2); # replacement subroutine
    }xmsgie;    # perl regex options: http://perldoc.perl.org/perlre.html
    return $text;
}

1;
