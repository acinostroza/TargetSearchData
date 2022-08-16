# A collection of functions to get file paths from TargetSearchData
# that are used as examples in TargetSearch

`tsd_path` <- function()
{
    return(find.package('TargetSearchData'))
}

`tsd_data_path` <- function(datapath='gc-ms-data')
{
    return(file.path(tsd_path(), datapath))
}

`tsd_file_path` <- function(filename, ...)
{
    path <- file.path(tsd_data_path(...), filename)
    stopifnot(file.exists(path))
    return(path)
}

`tsd_cdffiles` <- function(...)
{
    files <- dir(tsd_data_path(...), pattern="\\.cdf$", full.names=TRUE)
    return(files)
}

`tsd_rifiles` <- function(...)
{
    files <- dir(tsd_data_path(...), pattern="^RI_", full.names=TRUE)
    return(files)
}
