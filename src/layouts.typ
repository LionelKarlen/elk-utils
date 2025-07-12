#import "@preview/hydra:0.6.1": *;
#import "@preview/abbr:0.2.3";
#import "util.typ": format_list
/// A basic, nondescript layout that serves as the baseline for all others.
/// It sets the page, margins, and proper metadata for the document.
///
/// -> content
#let base_layout(
  /// The authors involved in the project
  /// -> string | string[]
  authors: "",
  /// The date of creation
  /// -> datetime
  date: datetime.today(),
  doc,
) = {
  set page(
    paper: "a4",
    margin: (x: 2cm, y: 2cm),
  )

  set text(size: 13pt)

  set par(
    linebreaks: "optimized",
    leading: 0.75em,
    spacing: 1.5em,
  )

  let authors = format_list(authors)

  set document(
    author: authors,
    date: date,
  )

  show math.equation.where(block: true): it => [
    #set align(left)
    #it
  ]

  doc

  // Abbreviations table setup
  {
    show heading.where(level: 1): it => {
      pagebreak(weak: true)
      it.body
    }
    abbr.list(
      title: context {
        if text.lang == "de" {
          "Abkürzungen"
        } else {
          "Abbreviations"
        }
      },
    )
  }
}

/// Layout used for exercise series.
///
/// -> content
#let series_layout(
  /// The class for which the document is being typed
  /// -> string
  class: "Class",
  /// The preamble for what to call Series
  /// -> string
  series_preamble: "Series",
  /// The series number
  /// -> number | string
  series: 1,
  /// The numbering employed by the series
  /// -> string
  numbering: "1.1.i.",
  /// The authors involved in the project
  /// -> string | string[]
  authors: "",
  /// The date of creation
  /// -> datetime
  date: datetime.today(),
  doc,
) = {
  // Initialise page
  show: base_layout.with(
    authors: authors,
    date: date,
  )

  let authors = format_list(authors)

  // Set up header
  set page(
    header-ascent: 0.75cm,
    header: context {
      if counter(page).get().first() > 1 {
        grid(
          columns: (1fr, 1fr, 1fr),
          align: (left, center, right),
          gutter: 6pt,
          smallcaps(class), [ #series_preamble #series ], authors,
        )
      }
    },
  )

  // Set title
  grid(
    columns: (1fr, 1fr, 1fr),
    rows: (auto, auto),
    align: (left, center, right),
    gutter: 6pt,
    smallcaps(class), [ #series_preamble #series ], authors,
    none, emph(date.display()), none,
  )
  box(line(length: 100%, stroke: 1pt))


  set heading(numbering: numbering)

  doc
}


/// Layout used for lecture writeups.
///
/// -> content
#let writeup_layout(
  /// The class for which the document is being typed
  /// -> string
  class: "Class",
  /// The preamble for what to call a lecture.
  /// -> string
  lecture_preamble: "Lecture",
  /// The lecture number
  /// -> number | string
  lecture: 1,
  /// The numbering employed by the lecture
  /// -> string
  numbering: "1.1.i.",
  /// The authors involved in the project
  /// -> string | string[]
  authors: "",
  /// The date of creation
  /// -> datetime
  date: datetime.today(),
  doc,
) = {
  // Initialise page
  show: base_layout.with(
    authors: authors,
    date: date,
  )

  let authors = format_list(authors)

  // Set up header
  set page(
    header-ascent: 0.75cm,
    header: context {
      if counter(page).get().first() > 1 {
        grid(
          columns: (1fr, 1fr, 1fr),
          align: (left, center, right),
          gutter: 6pt,
          smallcaps(class), [ #lecture_preamble #lecture], hydra(1),
        )
      }
    },
  )

  // Set title
  grid(
    columns: (1fr, 1fr),
    rows: (auto, auto),
    align: (left, right),
    gutter: 6pt,
    smallcaps(class), authors,
    [ #lecture_preamble #lecture], emph(date.display()),
  )
  box(line(length: 100%, stroke: 1pt))


  set heading(numbering: numbering)

  doc
}


/// Layout used for class summaries.
///
/// -> content
#let summary_layout(
  /// The class for which the document is being typed
  /// -> string
  class: "Class",
  /// The preamble for what to call a summary.
  /// -> string
  summary_preamble: "Summary",
  /// The numbering employed by the summary
  /// -> string
  numbering: "I.1.1.i.",
  /// The authors involved in the project
  /// -> string | string[]
  authors: "",
  /// A disclaimer page after the cover page.
  /// If set to none, the page will not render.
  /// -> content | none
  disclaimer: none,
  /// The date of creation
  /// -> datetime
  date: datetime.today(),
  doc,
) = {
  // Initialise page
  show: base_layout.with(
    authors: authors,
    date: date,
  )

  let authors = format_list(authors)

  // Set up header
  set page(
    header-ascent: 0.75cm,
    header: context {
      let page_number = counter(page)
      let first_page = counter(page).at(query(label("startofdoc")).first().location()).first()
      let chapter_locations = query(heading.where(level: 1, outlined: true)).map(v => counter(page)
        .at(v.location())
        .first())
      if page_number.get().first() >= first_page and chapter_locations.all(v => v != page_number.get().first()) {
        grid(
          columns: (1fr, 1fr),
          align: (left, right),
          gutter: 6pt,
          smallcaps(class), smallcaps(hydra(1)),
        )
      }
    },
    footer: context {
      let page_number = counter(page)
      let first_page = counter(page).at(query(label("startofdoc")).first().location()).first()
      if page_number.get().first() >= first_page {
        align(center, counter(page).display())
      }
    },
  )

  // Set title page
  v(5cm)
  align(center)[
    #text(size: 30pt)[
      #smallcaps(class)\
      #summary_preamble\
    ]
  ]
  align(center + bottom)[
    #text(size: 15pt)[
      #authors
    ]
  ]
  pagebreak()
  if disclaimer != none {
    disclaimer
    pagebreak()
  }
  outline(indent: 2em)
  pagebreak()
  [#metadata("startofdoc")<startofdoc>]


  set heading(numbering: numbering)

  show heading: it => {
    let number = counter(heading)
    if it.level == 1 {
      pagebreak(weak: true)
      v(5cm)
      align(center)[
        #text(size: 30pt)[
          #it
        ]
      ]
      pagebreak()
    } else if it.level == 2 {
      it.body
    } else {
      underline([#it.body])
    }
  }

  doc
}
