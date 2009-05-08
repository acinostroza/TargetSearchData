\name{TargetSearchData}
\alias{TargetSearchData}
\alias{sampleDescription}
\alias{refLibrary}
\alias{rimLimits}
\alias{RImatrix}
\alias{corRI}
\alias{peakData}
\alias{metabProfile}
\docType{data}
\title{Example GC-MS data for TargetSearch Package}
\description{
  A \code{TargetSearch} example GC-MS data. This package contains raw NetCDF files
  from a E.coli salt stress experiment, extracted peak list of each NetCDF file and
  three tab-delimted text files: a sample description, a reference library and
  a retention index marker definition. The data	is a subset of the original data
  from 200-400 seconds and 85-320 m/z. 
}
\usage{
 	data(TargetSearchData)
}
\format{
	The data contains the following objects:
    \describe{
	\item{sampleDescription}{a \code{tsSample} object. The sample description.}
	\item{refLibrary}{a \code{tsLib} object. The reference library.}
	\item{rimLimits}{a \code{tsRim} object. The RI markers definition.}
	\item{RImatrix}{a matrix object. The retention time of the RI markers.}
	\item{corRI}{a matrix object. The sample RI.}
	\item{peakData}{a \code{tsMSdata} object. The intensities and RIs of all the
		masses that were searched for.}
	\item{metabProfile}{a \code{tsProfile} object. The metabolite profile.}
    }
}
\details{
	All files are located in \code{gc-ms-data} subdirectory.
}

\seealso{
  \code{\link[TargetSearch]{ImportLibrary}},
  \code{\link[TargetSearch]{ImportSamples}},
  \code{\link[TargetSearch]{ImportFameSettings}},	  
}
\examples{
require(TargetSearch)

## The directory with the NetCDF GC-MS files
cdfpath <- file.path(.find.package("TargetSearchData"), "gc-ms-data")
cdfpath
list.files(cdfpath)
samp.file <- file.path(cdfpath, "samples.txt")
rim.file  <- file.path(cdfpath, "rimLimits.txt")
lib.file  <- file.path(cdfpath, "library.txt")

# import files from package
sampleDescription <- ImportSamples(samp.file, CDFpath = cdfpath, RIpath = ".")
refLibrary        <- ImportLibrary(lib.file)
rimLimits         <- ImportFameSettings(rim.file, mass = 87)
# perform RI correction
RImatrix          <- RIcorrect(sampleDescription, rimLimits, massRange = c(85,320),
                   IntThreshold = 25, pp.method = "ppc", Window = 15)
# update median RI
refLibrary        <- medianRILib(sampleDescription, refLibrary)
# get the sample RI
corRI             <- sampleRI(sampleDescription, refLibrary, r_thres = 0.95)
# obtain the peak Intensities of all the masses in the library
peakData          <- peakFind(sampleDescription, refLibrary, corRI)
# make a profile of the metabolite data
metabProfile      <- Profile(sampleDescription, refLibrary, peakData, r_thres = 0.95)

# show the metabolite profile
profileInfo(metabProfile)
# show the matrix intensities
Intensity(metabProfile)

}
\keyword{datasets}
