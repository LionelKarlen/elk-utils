#import "deps.typ": showybox

#let colours = (
  rgb("#780000"),
  rgb("606c38"),
  rgb("003049"),
  rgb("fb8500"),
  rgb("fb6f92"),
)

#let section(title, body) = context {
  let q = query(<cheatsheet>)
  // we are in a cheatsheet layout
  if q.len() > 0 {
    let count = counter(heading)
    count.step()
    let colour = colours.at(calc.rem(count.get().first(), colours.len()))
    box(inset: 4pt, stroke: colour + 1pt, fill: colour, width: 100%, align(
      center,
      smallcaps(text(weight: "extrabold", fill: white, size: 16pt, title)),
    ))
    showybox(
      above: 0pt,
      below: 10pt,
      sep: (
        thickness: 0pt,
      ),
      frame: (
        title-color: colour,
        body-color: none,
        footer-color: none,
        border-color: colour,
        thickness: 1pt,
        radius: 0pt,
      ),
      body,
    )
  } else {
    heading(title, level: 1)
    body
  }
}

#let subsection(title, body) = context {
  let q = query(<cheatsheet>)
  // we are in a cheatsheet layout
  if q.len() > 0 {
    let count = counter(heading)
    let colour = colours.at(calc.rem(count.get().first() - 1, colours.len()))
    box(grid(
      columns: (1fr, auto, 1fr),
      align: horizon + center,
      column-gutter: 1em,
      line(length: 100%, stroke: 1pt + colour),
      text(fill: colour, weight: "bold", smallcaps(title)),
      line(length: 100%, stroke: 1pt + colour),
    ))
    linebreak()
    body
  } else {
    heading(title, level: 2)
    body
  }
}

#let subsubsection(title, body) = {
  heading(title, level: 3)
  body
}
