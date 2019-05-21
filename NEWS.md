# roxygen2md 0.0.4.9002

- Document staged approach.
- Run `document()` automatically if `markdown = TRUE` in `DESCRIPTION`.


# roxygen2md 0.0.4.9001

- New `scope` argument to `roxygen2md()` and `markdownify()`.
- Tests make sure that transform works also when applying all rules.
- Convert `\link{}` expressions outside `\code{}`.
- Get rid of NOTEs.
- Aborts if `DESCRIPTION` doesn't have `Encoding: UTF-8` or `ASCII` set.
- `roxygen2md()` loses `pkg` argument, fully embraces `usethis::proj_get()` instead.
- New `convert_special_alien_links()` for converting code-link combinations that refer to functions in other packages.


# roxygen2md 0.0.4.9000

- New `markdownify()` function converts Rd to Markdown in character vectors (#10, @alexpghayes).


# roxygen2md 0.0-4

- Replacing utf8 by enc, package renamed (#8, @Kamsonka).
- Handle `\bold{}`, `\emph{}` and `\url{}`, and markup spanning over multiple lines (#6, @hturner).


# roxygen2md 0.0-3

- Now replaces `\emph`, `\bold` and `\url` with corresponding markdown.
- Now handles Rd markup split over multiple lines, e.g. 

          #' Author, A. (2017) An Important Reference. \emph{Journal of 
          #' Critical Research}, \bold{5}(2), 1--10.

# roxygen2md 0.0-2

- Now uses global replacement again.
- Improve detection for existing `markdown = TRUE` setting in `DESCRIPTION`.


# roxygen2md 0.0-1

Initial GitHub release.

- Single function `roxygen2md()` that can be run in the package's directory and converts all roxygen2 comments to Markdown. The `DESCRIPTION` is edited if necessary, or a message is given that the user should edit themselves.
- RStudio add-in with single menu item "Rd to Markdown".
