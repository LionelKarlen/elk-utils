#import "@preview/tidy:0.4.3"

// TODO: Copy this for all modules
// TODO: Justfile runner to generate all docs
// TODO: Monk precommit to run all generators
#let docs = tidy.parse-module(read("/src/layouts.typ"))
#tidy.show-module(docs, style: tidy.styles.default)
