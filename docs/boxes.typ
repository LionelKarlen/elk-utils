#import "@preview/tidy:0.4.3"

= Boxes
#let docs = tidy.parse-module(read("/src/boxes.typ"))
#tidy.show-module(docs, style: tidy.styles.default)
