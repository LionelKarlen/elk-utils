# Base Layout
## Layout
- indent after each heading
- large line-spacing

# Series
## Params
- class: string
- date: datetime
- series_preamble: ("Series" | "Serie") | string
- series: string | number
- authors: string | string[]
- numbering: string

## Layout
### Front page
{class} {series_preamble} {series} {authors}
center(emph({date}))

### Header
{class} {series_preamble} {series} [1fr] {collaborators}

# Summary
## Params
- class: string
- date: datetime | string
- authors: string | string[]
- disclaimer: content | none
- numbering: "I.1.1.1."

## Layout
- h1 sections are full-screen
### Front page
{class} {"Summary" | "Zusammenfassung"}
{authors}
emph({date})

### Header
{class} [1fr] {section(hydra)} [1fr] {subsection(hydra)}
