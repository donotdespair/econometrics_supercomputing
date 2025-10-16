
set.seed(123)                     # set seed for reproducibility
library(bsvars)                   # load the package      

us_fiscal_lsuw |>                 # use the data
  specify_bsvar$new() |>          # specify the model
  estimate(S = 100) |>            # initial estimation
  estimate(S = 1000) ->           # final estimation
  post                            # store final estimation output

save(                             # save the output
  post,                           # chose post object
  file = paste0("bsvar1.rda")     # file name
)
