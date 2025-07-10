#import "@preview/abbr:0.2.3"

/// Iff arrow shorthand
#let iff = math.class("relation", math.arrow.r.double.long.l)
/// If/follows arrow shorthand
#let follows = math.class("relation", math.arrow.r.double.long.l)

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

