#import "@preview/tidy:0.4.3"

= Shorthands
#let docs = tidy.parse-module(read("/src/shorthands.typ"))
#tidy.show-module(docs, style: tidy.styles.default)
