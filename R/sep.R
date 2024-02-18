detect_eol <- function(path) {
  con <- file(path, "rb")
  on.exit(close(con), add = TRUE)

  repeat {
    byte <- readBin(con, raw(1L))
    if (length(byte) == 0) return(native_eol())
    if (byte == 0x0d) return("\r\n")
    if (byte == 0x0a) return("\n")
  }
}

#' The native end-of-line identifier on the current platform
#'
#' Returns CRLF on Windows and LF on Linux/OS X.
#' @noRd
native_eol <- if (.Platform$OS.type == "windows") {
  function() "\r\n"
} else {
  function() "\n"
}
