# A collection of functions to get file paths from TargetSearchData
# that are used as examples in TargetSearch

`tsd_path` <- function()
{
    return(find.package('TargetSearchData'))
}

`tsd_data_path` <- function(datapath='gc-ms-data')
{
    ret <- dir.exists(path <- file.path(tsd_path(), datapath))
    if(all(ret))
        return(path)
    stop("Directory not found: ", path[!ret][1])
}

`tsd_file_path` <- function(filename, ...)
{
    ret <- file.exists(path <- file.path(tsd_data_path(...), filename))
    if(all(ret))
        return(path)
    stop("File not found: ", path[!ret][1])
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
