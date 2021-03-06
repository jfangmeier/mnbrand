% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tables.R
\name{theme_flextable}
\alias{theme_flextable}
\alias{theme_ft_mn}
\title{Format a flextable object for a Word or PowerPoint document}
\usage{
theme_ft_mn(
  ft_tbl,
  last_row_bold = FALSE,
  color = "gray",
  fontsize = 11,
  borders = "narrow"
)
}
\arguments{
\item{ft_tbl}{flextable object created using the flextable package}

\item{last_row_bold}{logical value to indicate whether the last row should be bold. Defaults to FALSE.}

\item{color}{string value to apply color scheme. Defaults to "gray". Other options include "blue" and "green". Word documents should use "gray".}

\item{fontsize}{numeric value to set the size of all fonts in the table. Defaults to 11. Word documents should use size 11.}

\item{borders}{string value to indicate whether borders are "narrow" or "thick". Defaults to "narrow". Word documents should use "narrow".}
}
\value{
A `flextable` object
}
\description{
This function applies formatting to flextable objects, using the State of Minnesota template for tables, 
which can be rendered in R Markdown to Word or PowerPoint. 
This function applies the theme only to existing elements when the function is called, and
it should be applied only after all elements of the table have been added.
}
\examples{

if (require("flextable")) {
  ft <- flextable(head(mtcars))
  ft <- theme_ft_mn(ft)
  ft 
}

}
