# Heading Anchors

Modifiers html headings with an id and anchor linking to the id.

## Usage

Add `heading_anchors="1"` to a MT template tag such as the `<mt:EntryBody>` tag:

    <$mt:EntryBody heading_anchors="1"$>

If the content of the Entry's body will be rendered as the following HTML via any formatting option (Markdown, Rich Text, Textile, etc):

    <h2>Attributes</h2>
    <h3>Base Colors</h3>
    <h4>Print Stylesheet</h4>

This modifier will convert the heading to:

    <h2 id="attributes">Attributes<a href="#attributes"> ¶</a></h2>
    <h3 id="base-colors">Base Colors<a href="#base-colors"> ¶</a></h3>
    <h4 id="print-stylesheet">Print Stylesheet<a href="#print-stylesheet"> ¶</a></h4>
