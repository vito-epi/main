# peh_userdocumentation/scripts/build_downloads_for_doi.R

build_downloads_for_doi <- function(
    doi,
    rds_key = "",
    out_script = "scripts/zenodo_rds_to_xlsx.R"
) {
  if (is.null(doi) || !nzchar(doi)) stop("Missing DOI")
  
  Sys.setenv(ZENODO_DOI = doi)
  
  if (!is.null(rds_key) && nzchar(rds_key)) {
    Sys.setenv(ZENODO_RDS_KEY = rds_key)
  } else {
    Sys.unsetenv("ZENODO_RDS_KEY")
  }
   
  # Run in its own env but with access to attached packages
  run_env <- new.env(parent = globalenv())
  source(out_script, local = run_env)
  
  invisible(TRUE)
}