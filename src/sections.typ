#import "util.typ": make_heading

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
  /// Reference label
  /// -> string | none
  reference_label: none,
  body,
) = {
  show heading: it => {
    it.body
  }
  [
    #if reference_label != none [
      #make_heading(
        level: level,
        title: title,
        title_preamble: title_preamble,
        number: number,
        outlined: outlined,
      )
      #label(reference_label)
    ] else [
      #make_heading(
        level: level,
        title: title,
        title_preamble: title_preamble,
        number: number,
        outlined: outlined,
      )
    ]

    #pad(left: 1cm, body)
  ]
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
  /// Reference label
  /// -> string | none
  reference_label: none,
  body,
) = base_section(
  level: level,
  outlined: outlined,
  title_preamble: "Definition",
  title: title,
  reference_label: reference_label,
  body,
)

/// Inline Example
///
/// -> content
#let inline_ex(body) = {
  show math.equation.where(block: true): set text(fill: blue.darken(50%))
  show math.equation: set text(fill: blue.darken(50%))
  set text(fill: blue.darken(50%))
  body
}

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
  /// Reference label
  /// -> string | none
  reference_label: none,
  body,
) = {
  base_section(
    level: level,
    title_preamble: context {
      if text.lang == "de" { "Beispiel" } else { "Example" }
    },
    title: title,
    outlined: outlined,
    reference_label: reference_label,
    inline_ex(body),
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
  /// Reference label
  /// -> string | none
  reference_label: none,
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
  reference_label: reference_label,
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
  /// Reference label
  /// -> string | none
  reference_label: none,
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
  reference_label: reference_label,
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
  /// Reference label
  /// -> string | none
  reference_label: none,
  body,
) = base_section(
  level: level,
  title_preamble: "Lemma",
  outlined: outlined,
  title: title,
  number: number,
  reference_label: reference_label,
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
  /// Reference label
  /// -> string | none
  reference_label: none,
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
  reference_label: reference_label,
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
  /// Reference label
  /// -> string | none
  reference_label: none,
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
  reference_label: reference_label,
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
  level: 2,
  /// Whether to include the heading in the Table of Contents.
  /// -> bool
  outlined: true,
  /// Reference label
  /// -> string | none
  reference_label: none,
  body,
) = {
  if reference_label != none [
    #heading(outlined: outlined, level: level, title)
    #label(reference_label)
  ] else [
    #heading(outlined: outlined, level: level, title)
  ]


  pad(left: 1cm, body)
}
