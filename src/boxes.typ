/// Basic box that serves as the baseline for other boxes.
/// -> content
#let base_box(
  /// The prefix title. If set to none, no title will be displayed.
  /// -> string | none
  title: none,
  /// Colour of the box. The box will be rendered with the given colour as the stroke, and 90% transparentised for the body fill.
  /// -> color
  color: color.gray,
  /// Body of the box.
  /// -> content
  body,
) = {
  rect(inset: 8pt, stroke: color, fill: color.transparentize(90%))[
    #if title != none {
      [*#title:* ]
    }
    #body
  ]
}

/// Alert box. Renders red with the "Alert" prefix.
///
/// -> content
#let alert(body) = base_box(
  color: color.red,
  title: context { if text.lang == "de" { "Achtung" } else { "Alert" } },
  body,
)

/// Equation box. Renders blue.
///
/// -> content
#let equation(body) = base_box(
  color: color.blue,
  body,
)

/// Tip box. Renders green with the "Tip" prefix.
///
/// -> content
#let tip(body) = base_box(
  color: color.green,
  title: "Tip",
  body,
)

/// Info box. Renders purple with the "Note" prefix.
///
/// -> content
#let info(body) = base_box(
  color: color.purple,
  title: context { if text.lang == "de" { "Bemerkung" } else { "Note" } },
  body,
)

/// Caution box. Renders orange with the "Caution" prefix.
///
/// -> content
#let caution(body) = base_box(
  color: color.orange,
  title: context { if text.lang == "de" { "Vorsicht" } else { "Caution" } },
  body,
)
