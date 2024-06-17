// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(
  title: "",
  subtitle:"",
  authors: (),
  date: none,
  logo: none,
  body,
) = {
  // Set the document's basic properties.
  set document(author: authors.map(a => a.name), title: title)
  set text(font: "Linux Libertine", lang: "ja")
  set heading(numbering: "1.1")
  set page(
    margin: (left: 25mm, right: 25mm, top: 30mm, bottom: 30mm),
    number-align: center,
)

  // Title page.
  // The page can contain a logo if you pass one with `logo: "logo.png"`.
  v(0.6fr)
  if logo != none {
    align(right, image(logo, width: 26%))
  }
  v(9.6fr)

  text(1.1em, date)
  v(2em, weak: true)

  text(2em, weight: 700, title)
  v(0.5em)
  text(1.5em, weight: 300, subtitle)
  // Author information.
  pad(
    top: 0.7em,
    right: 20%,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(start)[
        *#author.name* \
        // #author.discord
      ]),
    ),
  )

  v(2.4fr)
  pagebreak()


  // Main body.
  set par(justify: true)

  body
}