#' Is x a date-time object?
#'
#' An instant is a specific moment in time. Most common date-time 
#' objects (e.g, POSIXct, POSIXlt, and Date objects) are instants.
#'
#' @export is.instant is.timepoint
#' @aliases instant instants is.instant timepoint is.timepoint
#' @param x an R object   
#' @return TRUE if x is a POSIXct, POSIXlt, or Date object, FALSE otherwise.
#' @seealso \code{\link{is.timespan}}, \code{\link{is.POSIXt}}, \code{\link{is.Date}}
#' @keywords logic chron
#' @examples
#' is.instant(as.Date("2009-08-03")) # TRUE
#' is.timepoint(5) # FALSE
is.instant <- is.timepoint <- function(x) inherits(x, c("POSIXt", "POSIXct", "POSIXlt", "Date"))

#' The current time 
#'
#' @export now
#' @param tzone a character vector specifying which time zone you would like 
#'   the current time in. tzone defaults to Universal Coordinated Time (UTC). You 
#'   can retrieve the current time in your local timezone with now("").
#' @return the current date and time as a POSIXct object
#' 
#' @seealso \code{\link{here}}
#'
#' @keywords chron utilities
#' @examples
#' now()
#' now("GMT")
#' now("")
#' now() == now() # would be true if computer processed both at the same instant
#' now() < now() # TRUE
#' now() > now() # FALSE
now <- function(tzone = "UTC") 
  with_tz(Sys.time(), tzone)

#' The current time in your local timezone
#'
#' @export here
#' @return the current date and time as a POSIXct object
#' 
#' @seealso \code{\link{now}}
#'
#' @keywords chron utilities
#' @examples
#' here()
here <- function() now("") 


#' The current date 
#'
#' @export today
#' @param tzone a character vector specifying which time zone you would like to 
#'   find the current date of. tzone defaults to the system time zone set on your 
#'   computer.
#' @return the current date as a Date object
#'
#' @keywords chron utilities
#' @examples
#' today()
#' today("GMT")
#' today() == today("GMT") # not always true
#' today() < as.Date("2999-01-01") # TRUE  (so far)
today <- function(tzone = "") {
  as.Date(force_tz(floor_date(now(tzone), "day"), tzone = "UTC"))
}


#' 1970-01-01 UTC
#'
#' Origin is the date-time for 1970-01-01 UTC in POSIXct format. This date-time 
#' is the origin for the numbering system used by POSIXct, POSIXlt, chron, and 
#' Date classes.
#'
#' @export origin
#' @keywords data chron
#' @examples
#' origin
#' # "1970-01-01 GMT"
origin <- with_tz(structure(0, class = c("POSIXt", "POSIXct")), "UTC")