#import "@preview/abbr:0.2.3"
#import "colors.typ";

/// Iff arrow shorthand
#let iff = math.class("relation", math.arrow.r.double.long.l)
/// If/implies arrow shorthand
#let imp = math.class("relation", math.arrow.r.double.long)
/// Implies alias
#let impl = imp;
/// Implies alias
#let follows = imp;
/// To arrow shorthand
#let to = math.class("relation", math.arrow.r.long)
/// Definition to arrow shorthand
#let dto = math.class("relation", math.arrow.r.long.bar)
/// Not equal shorthand
#let neq = math.eq.not


/// highlight in any colour
/// -> content
#let hx(color: none, body) = highlight(color: color.transparentize(80%), body)
/// highlight red
/// -> content
#let hr(body) = hx(body, color: colors.base.red)
/// highlight blue
/// -> content
#let hb(body) = hx(body, color: colors.base.blue)
/// highlight green
/// -> content
#let hg(body) = hx(body, color: colors.base.green)

/// text in any colour
/// -> content
#let tx(color: none, body) = text(fill: color, body)
/// text red
/// -> content
#let tr(body) = tx(body, color: colors.base.red)
/// text blue
/// -> content
#let tb(body) = tx(body, color: colors.base.blue)
/// text green
/// -> content
#let tg(body) = tx(body, color: colors.base.green)

/// Clearly mark a region as todo.
/// -> content
#let todo(
  /// Optional content to render beneath the todo text
  ..body,
) = {
  linebreak()
  set align(center)
  text(size: 40pt, gradient.linear(..color.map.flare))[
    !todo!\
  ]
  if body.pos().first() != none {
    text(
      size: 20pt,
      ..body,
    )
  }
  linebreak()
}
