\name{as.duration}
\alias{as.duration}
\alias{as.duration,Duration-method}
\alias{as.duration,Interval-method}
\alias{as.duration,Period-method}
\alias{as.duration,difftime-method}
\alias{as.duration,numeric-method}
\title{Change an object to a duration.}
\usage{
  as.duration(x)
}
\arguments{
  \item{x}{Object to be coerced to a duration}
}
\value{
  A duration object
}
\description{
  as.duration changes Interval, Period and numeric class
  objects to Duration objects. Numeric objects are changed
  to Duration objects with the seconds unit equal to the
  numeric value.
}
\details{
  Durations are exact time measurements, whereas periods
  are relative time measurements. See
  \code{\link{Period-class}}. The length of a period
  depends on when it occurs. Hence, a one to one mapping
  does not exist between durations and periods. When used
  with a period object, as.duration provides an inexact
  estimate of the length of the period; each time unit is
  assigned its most common number of seconds. A period of
  one month is converted to 2628000 seconds (approximately
  30.42 days). This ensures that 12 months will sum to 365
  days, or one normal year. For an exact transformation,
  first transform the period to an interval with
  \code{\link{as.interval}}.
}
\examples{
span <- interval(ymd("2009-01-01"), ymd("2009-08-01")) #interval
# "2009-01-01 UTC--2009-08-01 UTC"
as.duration(span)
# 18316800s (~212 days)
as.duration(10) # numeric
# 10s
}
\seealso{
  \code{\link{Duration-class}}, \code{\link{new_duration}}
}
\keyword{chron}
\keyword{classes}
\keyword{manip}
\keyword{methods}

