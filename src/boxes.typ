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
#let alert(
  /// Title for the box.
  /// -> string | content | none
  title: context { if text.lang == "de" { "Achtung" } else { "Alert" } },
  body,
) = base_box(
  color: color.red,
  title: title,
  body,
)

/// Equation box. Renders blue.
///
/// -> content
#let eq(
  /// Title for the box.
  /// -> string | content | none
  title: none,
  body,
) = base_box(
  title: title,
  color: color.blue,
  body,
)

/// Tip box. Renders green with the "Tip" prefix.
///
/// -> content
#let tip(
  /// Title for the box.
  /// -> string | content | none
  title: "Tip",
  body,
) = base_box(
  color: color.green,
  title: title,
  body,
)

/// Info box. Renders purple with the "Info" prefix.
///
/// -> content
#let info(
  /// Title for the box.
  /// -> string | content | none
  title: "Info",
  body,
) = base_box(
  color: color.purple,
  title: title,
  body,
)

/// Caution box. Renders orange with the "Caution" prefix.
///
/// -> content
#let caution(
  /// Title for the box.
  /// -> string | content | none
  title: context { if text.lang == "de" { "Vorsicht" } else { "Caution" } },
  body,
) = base_box(
  color: color.orange,
  title: title,
  body,
)
