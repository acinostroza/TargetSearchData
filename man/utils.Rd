\name{utils}
\alias{utils}
\alias{tsd_path}
\alias{tsd_data_path}
\alias{tsd_file_path}
\alias{tsd_cdffiles}
\alias{tsd_rifiles}
\title{File path utilities for TargetSearch}
\description{
  A collection of simple functions to quickly access the
  \code{\link{TargetSearchData}} data files. These functions are used throughout
  \code{\link[TargetSearch]{TargetSearch}} examples. See details for an
  explanation of each function.
}
\usage{
  tsd_path()

  tsd_data_path(datapath='gc-ms-data')

  tsd_file_path(filename, ...)

  tsd_cdffiles(...)

  tsd_rifiles(...)
}
\arguments{
  \item{datapath}{A \code{character} string.
    This is the name of the subdirectory in which the example files for
    \code{\link[TargetSearch]{TargetSearch}} are installed. This value is
    hard-coded as \code{'gc-ms-data'} (because this is were the files are),
    so there is little need to change it.}
   \item{filename}{A \code{character} vector or a string.
     This is the name(s) of the file(s) whose absolute path is to be returned.
     The function checks internally that the file(s) exist.}
   \item{\ldots}{parameters passed to \code{ts_data_path}, more precisely
     \code{datapath}.}
}
\details{
  \code{tsd_path()} returns the path of \code{\link{TargetSearchData}}. It is
  a shorthand for \code{find.package('TargetSearchData')}.

  \code{tsd_data_path()} returns the full path of the directory where the
  \code{CDFs} and othe example files of \code{\link[TargetSearch]{TargetSearch}}
  are located. This path is hard-coded to \code{'gc-ms-data'}. The path can be
  changed by setting the data path parameter \code{datapath}, though this is
  unnecessary in general.

  \code{tsd_file_path()} returns the absolute path of one or more files
  (\code{filename}) inside the data directory (\code{datapath}). The function
  checks whether the file exist and fails if not. The name of the first
  missing file is printed.

  \code{tsd_cdffiles()} and \code{tsd_rifiles()} are convenience functions that
  return the list of NetCDF files and RI files contained in the data path,
  respectively.
}
\value{
  All functions return a character vector. They are paths to files or directories
  within \code{\link{TargetSearchData}}. The functions \code{tsd_cdffiles} and
  \code{tsd_rifiles} return a list of files.
}
\seealso{The package \code{\link[TargetSearch]{TargetSearch}}}
\examples{
  # get TargetSearchData path
  path <- tsd_path()

  # get TargetSearchData data path
  path <- tsd_data_path()

  # get the path to the files "samples.txt" in TargetSearchData
  path <- tsd_file_path('samples.txt')

  # get the list of CDF files
  cdffiles <- tsd_cdffiles()

  # get the list of RI files
  rifiles <- tsd_rifiles()
}
\author{Alvaro Cuadros-Inostroza}
