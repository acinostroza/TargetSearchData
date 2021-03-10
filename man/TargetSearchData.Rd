\name{TargetSearchData}
\alias{TargetSearchData}
\docType{package}
\title{Example GC-MS data for TargetSearch Package}
\description{
  A \code{\link[TargetSearch]{TargetSearch}} example GC-MS data files. This package contains
  raw NetCDF files from a E. coli salt stress experiment (Jozefczuk et al., 2010), extracted
  peak list of each NetCDF file, and three tab-delimited text files: a sample description, a
  reference library, and a retention index marker definition. The chromatographic data is a
  subset of the original NetCDF files restricted to 200-400 seconds and 85-320 \emph{m/z}.
}

\details{
  The package does not provide any R function or data structure, only
  exemplary experiment files for \code{\link[TargetSearch]{TargetSearch}}.

  All files are in the \code{gc-ms-data} subdirectory. The following
  files are provided.
  \itemize{
  \item \code{samples.txt}. Tab-delimited file of the samples metadata.
    It provides the CDF raw file of each sample, the so-called measurement day (MD), and the
    time point of the experiment. The MD is coded as a single digit year (starting from 2000),
    plus three digits that represent the day of that year. In this file, \dQuote{7235} means
    \dQuote{2007-Oct-23}. The time point is relative to the experiment and does not represent
    real time, i.e., 1 is first sampling point of the experiment, 3 the third time point, and so on.
    See \code{\link[TargetSearch]{ImportSamples}}.

  \item \code{rimLimits.txt}. Tab-delimited file of the retention time  markers (or FAMEs).
    The first two columns are the lower and upper window search of each marker in seconds, while
    the third column is the retention index (RI) standard of the marker. The \dQuote{mass} column
    is not present as it set to 87 \emph{m/z} by default.
    See \code{\link[TargetSearch]{ImportFameSettings}} for details.

  \item \code{library.txt}. Tab-delimited file of the metabolite library to be searched.
    Each row corresponds to a single metabolite, while columns are the metabolite name, expected
    RI, the search window to search around this RI (plus or minus), their selective masses (which
    are searched for), and their mass spectra.
    See \code{\link[TargetSearch]{ImportLibrary}} for details.

  \item \code{7235eg*.cdf}. NetCDF files of the baseline-corrected raw metabolite
  data. One file correspond to one sample, though the retention time and \emph{m/z} values are
  restricted to 200-400 seconds and 85-320. This was done to reduce the package size.

  \item \code{RI_7235eg*.txt}. Retention Index corrected and extracted
  peaks of the corresponding NetCDF files. These files are simple tab-delimited
  files containing the retention time, retention index, and spectra. Each
  spectrum is a list of \emph{m/z} and intensities separated by colons (:).
  }
}

\seealso{
  \code{\link[TargetSearch]{ImportLibrary}},
  \code{\link[TargetSearch]{ImportSamples}},
  \code{\link[TargetSearch]{ImportFameSettings}},
}

\author{
  Alvaro Cuadros-Inostroza.
}

\references{
    Jozefczuk, S. et al. Mol Syst Biol (2010) 6:364. \doi{10.1038/msb.2010.18}.
}
