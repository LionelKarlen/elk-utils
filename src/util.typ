/// Format an array into a string list, or leave as string
///
/// -> string
#let format_list(
  /// The array or string to be formatted
  /// -> array | string
  a,
) = {
  if type(a) == array {
    a.join(", ", last: ", and ")
  } else {
    a
  }
}

#let make_heading(
  level: 3,
  outlined: true,
  title_preamble: "",
  number: none,
  title: "",
) = {
  heading(
    level: level,
    outlined: outlined,
    [#underline(stroke: 1pt, offset: 1.5pt)[*#title_preamble.*] #{
        if number != none {
          [* #number*]
        }
      } #title
    ],
  )
}
