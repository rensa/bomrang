
#' Get BOM daily précis forecast for select towns from BOM
#'
#' Fetch the \acronym{BOM} daily précis forecast and return a data frame of the
#' seven-day town forecasts for a specified state or territory.
#'
#' @param state Australian state or territory as full name or postal code.
#' Fuzzy string matching via \code{\link[base]{agrep}} is done.  Defaults to
#' \dQuote{AUS} returning all state bulletins, see Details for more.
#'
#' @details Allowed state and territory postal codes, only one state per request
#' or all using \code{AUS}.
#'  \describe{
#'    \item{ACT}{Australian Capital Territory (will return NSW)}
#'    \item{NSW}{New South Wales}
#'    \item{NT}{Northern Territory}
#'    \item{QLD}{Queensland}
#'    \item{SA}{South Australia}
#'    \item{TAS}{Tasmania}
#'    \item{VIC}{Victoria}
#'    \item{WA}{Western Australia}
#'    \item{AUS}{Australia, returns forecast for all states, NT and ACT}
#'  }
#'
#' @return
#' A \code{\link[data.table]{data.table}} of an Australia \acronym{BOM} précis
#' seven day forecasts for \acronym{BOM} selected towns.  For full details of
#' fields and units returned see Appendix 2 in the \CRANpkg{bomrang} vignette,
#' use\cr \code{vignette("bomrang", package = "bomrang")} to view.
#'
#' @examples
#' \donttest{
#' # get the short forecast for Queensland
#' BOM_forecast <- get_precis_forecast(state = "QLD")
#' BOM_forecast
#'}
#' @references
#' Forecast data come from Australian Bureau of Meteorology (\acronym{BOM})
#' Weather Data Services \cr
#' \url{http://www.bom.gov.au/catalogue/data-feeds.shtml}
#'
#' Location data and other metadata for towns come from
#' the \acronym{BOM} anonymous \acronym{FTP} server with spatial data \cr
#' \url{ftp://ftp.bom.gov.au/anon/home/adfd/spatial/}, specifically the
#' \acronym{DBF} file portion of a shapefile, \cr
#' \url{ftp://ftp.bom.gov.au/anon/home/adfd/spatial/IDM00013.dbf}
#'
#' @author Adam H. Sparks, \email{adamhsparks@@gmail.com} and Keith Pembleton,
#'  \email{keith.pembleton@@usq.edu.au} and Paul Melloy,
#'  \email{paul@@melloy.com.au}
#'
#' @seealso \link{parse_precis_forecast}
#'
#' @export get_precis_forecast

get_precis_forecast <- function(state = "AUS") {

  # this is just a placeholder for functionality with parse_precis_forecast()
  filepath <- NULL
  # see internal_functions.R for these functions
  the_state <- .check_states(state)
  location <- .validate_filepath(filepath)
  forecast_out <- .return_precis(location, the_state)

  return(forecast_out)
}
