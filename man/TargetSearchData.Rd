\name{TargetSearchData}
\alias{TargetSearchData}
\docType{package}
\title{Example GC-MS data for TargetSearch Package}
\description{
  A \code{TargetSearch} example GC-MS data files. This package contains raw NetCDF files
  from a E.coli salt stress experiment, extracted peak list of each NetCDF file and
  three tab-delimted text files: a sample description, a reference library and
  a retention index marker definition. The data is a subset of the original data
  from 200-400 seconds and 85-320 m/z. 
}

\details{
  These package does not provide any R function or data structure, only
  exemplary experiment files for \code{TargetSearch}.

  All files are located in \code{gc-ms-data} subdirectory. The following
  files are provided.
  \itemize{
  \item \code{samples.txt}. Tab-delimited file of the samples metadata.
  It provides the CDF raw file, measurement day and the time point of the
  experiment.

  \item \code{rimLimits.txt}. Tab-delimited file of the retention time
  markers (or FAMEs). See \code{\link[TargetSearch]{ImportFameSettings}} 
  for details.

  \item \code{library.txt}. Tab-delimited file of the metabolite library
  to be searched. See \code{\link[TargetSearch]{ImportLibrary}} for details.

  \item \code{7235eg*.cdf}. NetCDF files of the baseline-corrected raw metabolite
  data. One file correspond to one sample.

  \item \code{RI_7235eg*.txt}. Retention Index corrected and extracted
  peaks of the corresponding NetCDF files. These files are simple tab-delimited
  files containing the retention time, retention index, and spectra. Each
  spectrum is a list of m/z and intensities separated by colons (:).
  }
}

\seealso{
  \code{\link[TargetSearch]{ImportLibrary}},
  \code{\link[TargetSearch]{ImportSamples}},
  \code{\link[TargetSearch]{ImportFameSettings}},
}

\author{
  Maintainer: Alvaro Cuadros-Inostroza <inostroza@mpimp-golm.mpg.de>
}
