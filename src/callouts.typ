#import "deps.typ": showybox;
#import "util.typ": parse_positional;
#import "localisation.typ": i18n;
#import "colors.typ": base;

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
      if preamble != none [#strong(preamble)]
      if title != none [: #emph(title)] else [.]
    },
    ..body,
  )
  box(stroke: (left: 1pt + color), inset: (left: 0.5pt), callout_box)
}



/// Theorem callout box
/// @param ..contents: args<content> - Content blocks for the callout. If the number of contents is greater than 1, the first one is considered the title.
/// -> content
#let theorem(..contents) = callout(
  preamble: context { i18n.at(text.lang).callouts.theorem },
  ..contents,
);

/// Definition callout box
/// @param ..contents: args<content> - Content blocks for the callout. If the number of contents is greater than 1, the first one is considered the title.
/// -> content
#let definition(..contents) = callout(
  preamble: context { i18n.at(text.lang).callouts.definition },
  ..contents,
);

/// Lemma callout box
/// @param ..contents: args<content> - Content blocks for the callout. If the number of contents is greater than 1, the first one is considered the title.
/// -> content
#let lemma(..contents) = callout(
  preamble: context { i18n.at(text.lang).callouts.lemma },
  ..contents,
);

/// Proof callout box
/// @param ..contents: args<content> - Content blocks for the callout. If the number of contents is greater than 1, the first one is considered the title.
/// -> content
#let proof(..contents) = callout(
  preamble: context { i18n.at(text.lang).callouts.proof },
  ..contents,
);

/// Corollary callout box
/// @param ..contents: args<content> - Content blocks for the callout. If the number of contents is greater than 1, the first one is considered the title.
/// -> content
#let corollary(..contents) = callout(
  preamble: context { i18n.at(text.lang).callouts.corollary },
  ..contents,
);

/// Caution callout box
/// @param ..contents: args<content> - Content blocks for the callout. If the number of contents is greater than 1, the first one is considered the title.
/// -> content
#let caution(..contents) = callout(
  preamble: context { i18n.at(text.lang).callouts.caution },
  color: base.red,
  ..contents,
);

/// Tip callout box
/// @param ..contents: args<content> - Content blocks for the callout. If the number of contents is greater than 1, the first one is considered the title.
/// -> content
#let tip(..contents) = callout(
  preamble: context { i18n.at(text.lang).callouts.tip },
  color: base.green,
  ..contents,
);

/// Info callout box
/// @param ..contents: args<content> - Content blocks for the callout. If the number of contents is greater than 1, the first one is considered the title.
/// -> content
#let info(..contents) = callout(
  preamble: context { i18n.at(text.lang).callouts.info },
  color: base.blue,
  ..contents,
);

/// Example callout box
/// @param ..contents: args<content> - Content blocks for the callout. If the number of contents is greater than 1, the first one is considered the title.
/// -> content
// TODO: left align equations
// TODO: change math font
#let example(..contents) = callout(
  preamble: context { i18n.at(text.lang).callouts.example },
  color: base.blue,
  ..contents,
);
