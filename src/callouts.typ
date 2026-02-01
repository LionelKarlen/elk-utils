#import "@preview/showybox:2.0.4": showybox;
#import "util.typ": parse_positional;
#import "colors.typ": *;

/// Callout box, used to highlight a certain section.
/// @param preamble: string|none - Preamble for the title section
/// @param color: color - Background color for the box
/// @param ..contents: args<content> - Content blocks for the callout. If the number of contents is greater than 1, the first one is considered the title.
/// -> content
#let callout(preamble: "", color: base.black, ..contents) = {
  let (title, ..body) = parse_positional(..contents)
  let callout_box = showybox(
    frame: (
      radius: 0pt,
      thickness: 0pt,
      border-color: color,
      title-color: color.lighten(90%),
      body-color: color.lighten(90%),
    ),
    sep: (
      thickness: 0pt,
    ),
    title-style: (
      color: black,
      weight: "regular",
      align: left,
      sep-thickness: 0pt,
    ),
    title: {
      if preamble.len() != 0 [#strong(preamble)]
      if title != none [: #emph(title)] else [.]
    },
    ..body,
  )
  box(stroke: (left: 1pt + color), inset: (left: 0.5pt), callout_box)
}



// TODO: Localisation

/// Theorem callout box
/// @param ..contents: args<content> - Content blocks for the callout. If the number of contents is greater than 1, the first one is considered the title.
/// -> content
#let theorem(..contents) = callout(preamble: "Theorem", ..contents);

/// Definition callout box
/// @param ..contents: args<content> - Content blocks for the callout. If the number of contents is greater than 1, the first one is considered the title.
/// -> content
#let definition(..contents) = callout(preamble: "Definition", ..contents);

/// Lemma callout box
/// @param ..contents: args<content> - Content blocks for the callout. If the number of contents is greater than 1, the first one is considered the title.
/// -> content
#let lemma(..contents) = callout(preamble: "Lemma", ..contents);

/// Proof callout box
/// @param ..contents: args<content> - Content blocks for the callout. If the number of contents is greater than 1, the first one is considered the title.
/// -> content
#let proof(..contents) = callout(preamble: "Proof", ..contents);

/// Corollary callout box
/// @param ..contents: args<content> - Content blocks for the callout. If the number of contents is greater than 1, the first one is considered the title.
/// -> content
#let corollary(..contents) = callout(preamble: "Corollary", ..contents);

/// Caution callout box
/// @param ..contents: args<content> - Content blocks for the callout. If the number of contents is greater than 1, the first one is considered the title.
/// -> content
#let caution(..contents) = callout(
  preamble: "Caution",
  color: base.red,
  ..contents,
);

/// Tip callout box
/// @param ..contents: args<content> - Content blocks for the callout. If the number of contents is greater than 1, the first one is considered the title.
/// -> content
#let tip(..contents) = callout(
  preamble: "Tip",
  color: base.green,
  ..contents,
);

/// Info callout box
/// @param ..contents: args<content> - Content blocks for the callout. If the number of contents is greater than 1, the first one is considered the title.
/// -> content
#let info(..contents) = callout(
  preamble: "Info",
  color: base.blue,
  ..contents,
);

/// Example callout box
/// @param ..contents: args<content> - Content blocks for the callout. If the number of contents is greater than 1, the first one is considered the title.
/// -> content
// TODO: left align equations
// TODO: change math font
#let example(..contents) = callout(
  preamble: "Example",
  color: base.blue,
  ..contents,
);
