the_plan <-
  drake_plan(

   ## Plan targets in here.
             df_pbs = get_pbs_data(),
             df_pbs_large = get_pbs_data('pbs'),

             week2 = target(
                                  command = {
                                    rmarkdown::render(knitr_in("analysis/week2.Rmd"))
                                    file_out("docs/week2.html")
                                  }
             ),



)
