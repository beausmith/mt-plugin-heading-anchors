# Heading Anchors

Provides a template tag modifier to update all html headings with an id and anchor linking to the id.

## Usage

Add `heading_anchors="1"` to a MT template tag such as the `<mt:EntryBody>` tag:

    <$mt:EntryBody heading_anchors="1"$>

If the content of the Entry's body will be rendered as the following HTML via any formatting option (Markdown, Rich Text, Textile, etc):

    <h2>Attributes</h2>
    <h3>Base Colors</h3>
    <h4>Print Stylesheet</h4>

This modifier will convert the heading to:

    <h2 id="attributes">Attributes<a href="http://domain.com/entries/basename.html#attributes"> ¶</a></h2>
    <h3 id="base-colors">Base Colors<a href="http://domain.com/entries/basename.html#base-colors"> ¶</a></h3>
    <h4 id="print-stylesheet">Print Stylesheet<a href="http://domain.com/entries/basename.html#print-stylesheet"> ¶</a></h4>

## Installation

Just like any other plugin.

    $MT_HOME/
        plugins/
            HeadingAnchors/
        mt-static/
            plugins/
                HeadingAnchors/

The mt-static directory is optional. It contains css code to hide the anchors by default and then show them on hover. This css can be linked to or pasted into a site's existing css file.

## Context

If an entry is in context then the anchor will have a full url otherwise it will only be the page anchor.

Thus if the blog description is:

    <h4>Fooburger</h4>

And the markup in the header is:

    <$mt:BlogDescription heading_anchors="1"$>

With an entry in context the href will be a full url:

    <h4 id="fooburger">fooburger<a href="http://domain.com/entries/basename.html#fooburger"> ¶</a></h4>

Outside of entry context just the anchor:

    <h4 id="fooburger">fooburger<a href="#fooburger"> ¶</a></h4>

## Caveats

If the heading content is generic the id  which is created may confilict with an other id on the page.

If the content of the heading is generic, when dirified it may conflict with another id in the html.

In this example the "footer" id appears twice.

    <div class="entry">
        <h2 id="footer">Footer<a href="http://domain.com/entries/basename.html#footer"></a></h2>
    </div>
    <div id="footer"><!-- footer content --></div>

To avoid this, either make your heading content more specific or change the ids in the html.

