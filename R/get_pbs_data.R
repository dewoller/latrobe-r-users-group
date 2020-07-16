
# -------------------------------------------------
get_pbs_data <- function( chronic_disease = 'PAI', database = 'pbs_sample' ) {

  # loads the PostgreSQL driver
  drv <- dbDriver("PostgreSQL")
  con <- dbConnect(drv, dbname = database,
                   host = "himsql7.latrobe.edu.au", port = 5432,
                   user = "dewollershei", password = Sys.getenv('PBS_LATROBE_PASSWORD' ))
  on.exit(dbDisconnect(con))
  query =  paste0( "

                 select supply_date, sex, yob, atc_meaning
                 from pbs  p
                 JOIN patient USING (pin)
                 JOIN pbs_item pi USING (pbs_item)
                 JOIN pbs_atc using( atc_code)
                 where chronic_disease_id='", chronic_disease, "'" )
  print(query)
  dbGetQuery( con, query) %>% as_tibble()

}

