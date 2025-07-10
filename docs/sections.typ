#import "@preview/tidy:0.4.3"

= Sections
#let docs = tidy.parse-module(read("/src/sections.typ"))
#tidy.show-module(docs, style: tidy.styles.default)
