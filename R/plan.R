the_plan <-
  drake_plan(

   ## Plan targets in here.
             df_pbs = get_pbs_data(chronic_disease='PAI', database='pbs_sample'),
             df_pbs_large = get_pbs_data(chronic_disease='PAI', database='pbs'),

             week2 = target(
                                  command = {
                                    workflowr::wflow_build(knitr_in("analysis/week2.Rmd"))
                                    file_out("docs/week2.html")
                                  }
             ),



)
