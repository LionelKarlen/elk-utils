#import "@preview/tidy:0.4.3"

= Visualisations
#let docs = tidy.parse-module(read("/src/visualisations.typ"))
#tidy.show-module(docs, style: tidy.styles.default)
