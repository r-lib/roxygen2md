## roxygen2md 0.0-4 (2017-12-03)

- Replacing utf8 by enc, package renamed (#8, @Kamsonka).
- Handle `\bold{}`, `\emph{}` and `\url{}`, and markup spanning over multiple lines (#6, @hturner).


## roxygen2md 0.0-3 (2017-08-25)

- Now replaces `\emph`, `\bold` and `\url` with corresponding markdown.
- Now handles Rd markup split over multiple lines, e.g. 

          #' Author, A. (2017) An Important Reference. \emph{Journal of 
          #' Critical Research}, \bold{5}(2), 1--10.

## roxygen2md 0.0-2 (2017-02-03)

- Now uses global replacement again.
- Improve detection for existing `markdown = TRUE` setting in `DESCRIPTION`.


## roxygen2md 0.0-1 (2017-02-03)

Initial GitHub release.

- Single function `roxygen2md()` that can be run in the package's directory and converts all roxygen2 comments to Markdown. The `DESCRIPTION` is edited if necessary, or a message is given that the user should edit themselves.
- RStudio add-in with single menu item "Rd to Markdown".



