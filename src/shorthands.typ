#import "@preview/abbr:0.2.3"

/// Iff arrow shorthand
#let iff = math.class("relation", math.arrow.r.double.long.l)
/// If/follows arrow shorthand
#let follows = math.class("relation", math.arrow.r.double.long)
/// To arrow shorthand
#let to = math.class("relation", math.arrow.r.long)


/// highlight in any colour
#let hx(color: none, body) = highlight(color: color.transparentize(80%), body)
/// highlight alert
#let ha(body) = highlight(fill: red.transparentize(80%), body)
/// highlight equation
#let he(body) = highlight(fill: blue.transparentize(80%), body)
/// highlight info
#let hi(body) = highlight(fill: purple.transparentize(80%), body)
/// highlight tip
#let ht(body) = highlight(fill: green.transparentize(80%), body)
/// highlight caution
#let hc(body) = highlight(fill: orange.transparentize(80%), body)

/// text in any colour
#let tx(color: none, body) = text(fill: color, body)
/// text in alert
#let ta(body) = text(fill: red, body)
/// text in equation
#let te(body) = text(fill: blue, body)
/// text in info
#let ti(body) = text(fill: purple, body)
/// text in tip
#let tt(body) = text(fill: green, body)
/// text in caution
#let tc(body) = text(fill: orange, body)

/// Quick mathematical function defintion.
/// -> content
#let func(
  /// From where the function maps.
  /// -> content
  from: $RR$,
  /// To where the function maps
  /// -> content
  to: $RR$,
  /// The name of the function.
  /// -> content
  name: $f$,
  /// Whether the function definition is on sets, or defining values.
  /// -> bool
  is_set: true,
) = {
  let arr = if is_set {
    sym.arrow.r.long
  } else {
    sym.arrow.r.long.bar
  }
  $#name: #from #arr #to$
}

/// Clearly mark a region as todo.
/// -> content
#let todo(
  /// The colour in which to render the todo text
  /// -> color
  color: gradient.linear(..color.map.flare),
  /// Optional content to render beneath the todo text
  ..body,
) = {
  linebreak()
  set align(center)
  text(size: 40pt, color)[
    !todo!\
  ]
  text(
    size: 20pt,
    if body != none {
      body.pos().first()
    },
  )
  linebreak()
}

/// Automatic abbreviation shorthand for singular
/// -> content
#let a(body) = abbr.a(body)
/// Automatic abbreviation shorthand for plural
/// -> content
#let apl(body) = abbr.pla(body)
/// Long abbreviation shorthand for singular
/// -> content
#let al(body) = abbr.l(body)
/// Long abbreviation shorthand for plural
/// -> content
#let apll(body) = abbr.pll(body)

