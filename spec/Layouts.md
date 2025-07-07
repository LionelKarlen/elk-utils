# Base Layout
## Params
- class: string
- date: datetime

## Layout
- indent after each heading
- large line-spacing

# Series
## Params
- series_preamble: ("Series" | "Serie") | string
- series: string | number
- collaborators: string | string[]
- numbering: string

## Layout
### Front page
{class} {series_preamble} {series}
{collaborators}
emph({date})

### Header
{class} {series_preamble} {series} [1fr] {collaborators}


# Write-up
## Params
- lecture_preamble: ("Lecture" | "Vorlesung") | string
- lecture: string | number
- collaborators: string | string[]

## Layout
### Front page
{class} {lecture_preamble} {lecture}
{collaborators}
emph({date})

### Header
{class} {lecture_preamble} {lecture} [1fr] {section(hydra)}

# Summary
## Params
- collaborators: string | string[]
- numbering: "I.1.1.1."

## Layout
### General
- h1 sections are full-screen
### Front page
{class} {"Summary" | "Zusammenfassung"}
{collaborators}
emph({date})

### Header
{class} [1fr] {section(hydra)} [1fr] {subsection(hydra)}
