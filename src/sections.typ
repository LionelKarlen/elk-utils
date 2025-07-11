/// Base section to serve as the basis of all other sections.
///
/// -> content
#let base_section(
  /// Heading level for the section.
  /// -> number
  level: 3,
  /// Title preamble for the heading.
  /// -> string | none
  title_preamble: "",
  /// Title for the heading.
  /// -> string | content
  title: "",
  /// Numbering for reference. This is not an internal reference, and will not show up when referencing. The assumption here is that this number comes from a different script, and will therefore not (or rarely) change.
  /// -> string | none
  number: none,
  outlined: true,
  body,
) = {
  show heading: it => {
    it.body
  }

  heading(level: level)[#underline(stroke: 1pt, offset: 1.5pt)[*#title_preamble.*] #{
      if number != none {
        [* #number*]
      }
    } #title]

  pad(left: 1cm, body)
}

/// Definition section
///
/// -> content
#let def(
  /// Title of the section
  /// -> string | content
  title: "",
  /// Level of the heading
  /// -> auto | number
  level: 3,
  body,
) = base_section(level: level, title_preamble: "Definition", title: title, body)

/// Example section
///
/// -> content
#let ex(
  /// Title of the section
  /// -> string | content
  title: "",
  /// Level of the heading
  /// -> auto | number
  level: 3,
  body,
) = {
  show math.equation.where(block: true): set text(fill: blue.darken(50%))
  base_section(
    level: level,
    title_preamble: context { if text.lang == "de" { "Beispiel" } else { "Example" } },
    title: title,
    outlined: false,
    body,
  )
}


/// Note section
///
/// -> content
#let note(
  /// Title of the section
  /// -> string | content
  title: "",
  /// Level of the heading
  /// -> auto | number
  level: 3,
  body,
) = base_section(
  level: level,
  title_preamble: context {
    if text.lang == "de" {
      "Bemerkung"
    } else {
      "Remark"
    }
  },
  title: title,
  body,
)

/// Theorem section
///
/// -> content
#let theorem(
  /// Title of the section
  /// -> string | content
  title: "",
  /// Level of the heading
  /// -> auto | number
  level: 3,
  /// Numbering for reference. This is not an internal reference, and will not show up when referencing. The assumption here is that this number comes from a different script, and will therefore not (or rarely) change.
  /// -> string | none
  number: none,
  body,
) = base_section(
  level: level,
  title_preamble: context {
    if text.lang == "de" {
      "Satz"
    } else {
      "Theorem"
    }
  },
  title: title,
  number: number,
  body,
)

/// Lemma section
///
/// -> content
#let lemma(
  /// Title of the section
  /// -> string | content
  title: "",
  /// Level of the heading
  /// -> auto | number
  level: 3,
  /// Numbering for reference. This is not an internal reference, and will not show up when referencing. The assumption here is that this number comes from a different script, and will therefore not (or rarely) change.
  /// -> string | none
  number: none,
  body,
) = base_section(
  level: level,
  title_preamble: "Lemma",
  title: title,
  number: number,
  body,
)

/// Corollary section
///
/// -> content
#let cor(
  /// Title of the section
  /// -> string | content
  title: "",
  /// Level of the heading
  /// -> auto | number
  level: 3,
  /// Numbering for reference. This is not an internal reference, and will not show up when referencing. The assumption here is that this number comes from a different script, and will therefore not (or rarely) change.
  /// -> string | none
  number: none,
  body,
) = base_section(
  level: level,
  title_preamble: context {
    if text.lang == "de" {
      "Korollar"
    } else { "Corollary" }
  },
  title: title,
  number: number,
  body,
)
