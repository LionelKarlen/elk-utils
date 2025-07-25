#import "@preview/cetz:0.4.0"

/// Draw a 2d xy-coordinate system quickly
///
/// -> content
#let coordinate_system(
  /// Grid step size. The grid can be disabled by setting this value to none.
  /// -> number | none
  grid_steps: none,
  /// Coordinate system size. Used for symmetric coordinate systems, that are centered around 0. If != none, overwrites the values given by `from` and `to`.
  /// -> number | none
  size: none,
  /// Top left corner of the coordinate system.
  /// -> coordinate
  from: (0, 0),
  /// Bottom right corner of the coordinate system.
  /// -> coordinate
  to: (0, 0),
  /// Whether to render the axes.
  /// -> bool
  show_axes: true,
  /// Label of the x axis. Renders next to the arrow on the axis. If `show_axes` is `false`, this option has no effect. Setting this to none, hides the label.
  /// -> content | none
  label_x_axis: $x$,
  /// Label of the y axis. Renders next to the arrow on the axis. If `show_axes` is `false`, this option has no effect.
  /// -> content | none
  label_y_axis: $y$,
) = {
  // define from and to
  let f = from
  let t = to
  // overwrite if a size is given
  if size != none {
    f = (-size, size)
    t = (size, -size)
  }
  if grid_steps != none {
    // draw grid
    cetz.draw.grid(f, t, step: 1 / grid_steps, help-lines: true)
  }
  if show_axes {
    // x axis
    cetz.draw.line(
      (f.first(), 0),
      (t.first(), 0),
      mark: (end: "stealth", fill: black),
      name: "x_axis",
    )
    if label_x_axis != none {
      cetz.draw.content("x_axis.end", padding: .1, anchor: "west", label_x_axis)
    }
    // y axis
    cetz.draw.line(
      (0, t.last()),
      (0, f.last()),
      mark: (end: "stealth", fill: black),
      name: "y_axis",
    )
    if label_y_axis != none {
      cetz.draw.content("y_axis.end", padding: .1, anchor: "west", label_y_axis)
    }
  }
}

/// Mark a point on the canvas.
/// -> content
#let point(
  /// Position of the point.
  /// -> coordinate
  at: (0, 0),
  /// Label for the point. Set to none to disable.
  /// -> content | none
  label: none,
  /// Scalar size of the dot.
  /// -> number
  size: 1,
  /// Anchor for the label.
  /// -> string
  anchor: "west",
) = {
  cetz.draw.circle(at, radius: 0.05 * size, fill: black)
  if label != none {
    cetz.draw.content(at, anchor: anchor, padding: .1, label)
  }
}

/// Mark a point on the coordinate line. If the given coordinate is not on any axis, it will simply display a point.
/// -> content
#let cmark(
  /// Position of the mark:
  /// -> coordinate
  at: (0, 0),
  /// Label for the mark. Set to none to disable.
  /// -> content | none
  label: none,
  /// Whether to flip the anchor of the label.
  /// -> bool
  flip: false,
  /// Scalar size of the mark / dot.
  /// -> number
  size: 1,
) = {
  let dist = size * 0.1
  let anchor = "west"
  if at.first() == 0 and at.last() != 0 {
    cetz.draw.line((-dist, at.last()), (dist, at.last()))
    if label != none {
      if flip {
        anchor = "east"
      }
      cetz.draw.content(at, anchor: anchor, padding: .1, label)
    }
  } else if at.last() == 0 and at.first() != 0 {
    anchor = "north"
    cetz.draw.line((at.first(), -dist), (at.first(), dist))
    if label != none {
      if flip {
        anchor = "south"
      }
      cetz.draw.content(at, anchor: anchor, padding: .1, label)
    }
  } else {
    point(at: at, label: label, size: size)
  }
}

/// Eline shorthand to quickly define a line/arrow with a label.
///
/// -> content
#let eline(
  /// From position
  /// -> coordinate
  from,
  /// To position
  /// -> coordinate
  to,
  /// Label anchor position
  /// -> string
  anchor: none,
  /// Label position along the line
  /// -> string
  pos: ".mid",
  /// Line/Arrow/Text colour
  /// -> color
  colour: black,
  /// Arrow mark
  /// -> string
  mark: none,
  /// Label content
  /// -> string | content
  label: none,
  /// Line reference name
  /// -> string
  name: none,
  /// Label padding
  /// -> number
  padding: 5pt,
) = {
  cetz.draw.line(from, to, fill: colour, stroke: colour, mark: (end: mark, fill: colour), name: name)
  if label != none {
    if anchor != none {
      cetz.draw.content(name, padding: padding, anchor: anchor, text(fill: colour, label))
    } else {
      cetz.draw.content(name + pos, padding: padding, text(fill: colour, label))
    }
  }
}
