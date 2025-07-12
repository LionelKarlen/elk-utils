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
  /// Whether to include the heading in the Table of Contents.
  /// -> bool
  outlined: true,
  body,
) = {
  show heading: it => {
    it.body
  }

  heading(level: level, outlined: outlined)[#underline(stroke: 1pt, offset: 1.5pt)[*#title_preamble.*] #{
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
  /// Whether to include the heading in the Table of Contents.
  /// -> bool
  outlined: true,
  body,
) = base_section(level: level, outlined: outlined, title_preamble: "Definition", title: title, body)

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
  /// Whether to include the heading in the Table of Contents.
  /// -> bool
  outlined: true,
  body,
) = {
  show math.equation.where(block: true): set text(fill: blue.darken(50%))
  base_section(
    level: level,
    title_preamble: context { if text.lang == "de" { "Beispiel" } else { "Example" } },
    title: title,
    outlined: outlined,
    body,
  )
}


/// Note section
///
/// -> content
#let rmrk(
  /// Title of the section
  /// -> string | content
  title: "",
  /// Level of the heading
  /// -> auto | number
  level: 3,
  /// Whether to include the heading in the Table of Contents.
  /// -> bool
  outlined: true,
  body,
) = base_section(
  level: level,
  outlined: outlined,
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
#let thrm(
  /// Title of the section
  /// -> string | content
  title: "",
  /// Level of the heading
  /// -> auto | number
  level: 3,
  /// Numbering for reference. This is not an internal reference, and will not show up when referencing. The assumption here is that this number comes from a different script, and will therefore not (or rarely) change.
  /// -> string | none
  number: none,
  /// Whether to include the heading in the Table of Contents.
  /// -> bool
  outlined: true,
  body,
) = base_section(
  level: level,
  outlined: outlined,
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
#let lma(
  /// Title of the section
  /// -> string | content
  title: "",
  /// Level of the heading
  /// -> auto | number
  level: 3,
  /// Numbering for reference. This is not an internal reference, and will not show up when referencing. The assumption here is that this number comes from a different script, and will therefore not (or rarely) change.
  /// -> string | none
  number: none,
  /// Whether to include the heading in the Table of Contents.
  /// -> bool
  outlined: true,
  body,
) = base_section(
  level: level,
  title_preamble: "Lemma",
  outlined: outlined,
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
  /// Whether to include the heading in the Table of Contents.
  /// -> bool
  outlined: true,
  body,
) = base_section(
  level: level,
  outlined: outlined,
  title_preamble: context {
    if text.lang == "de" {
      "Korollar"
    } else { "Corollary" }
  },
  title: title,
  number: number,
  body,
)

/// Procedure section
///
/// -> content
#let prcd(
  /// Title of the section
  /// -> string | content
  title: "",
  /// Level of the heading
  /// -> auto | number
  level: 3,
  /// Whether to include the heading in the Table of Contents.
  /// -> bool
  outlined: true,
  body,
) = base_section(
  level: level,
  outlined: outlined,
  title_preamble: context {
    if text.lang == "de" {
      "Prozedur"
    } else {
      "Procedure"
    }
  },
  title: title,
  body,
)

/// Anonymous section. Used for all-purpose sections, particularly sub-section that have no defined use, or serve as a collection of more specific sections.
///
/// -> content
#let anon(
  /// Title of the section
  /// -> string | content
  title: "",
  /// Level of the heading
  /// -> auto | number
  level: 3,
  /// Whether to include the heading in the Table of Contents.
  /// -> bool
  outlined: true,
  body,
) = {
  heading(outlined: outlined, level: level, title)

  pad(left: 1cm, body)
}
