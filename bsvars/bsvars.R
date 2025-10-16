
args      = commandArgs(trailingOnly = TRUE)  # get arguments
iteration = as.integer(args[1])               # first argument is iteration
rm(args)                                      # remove what's redundant

set.seed(123 + iteration)                     # set seed for reproducibility        

rw = apply(                                   # generate random walk data
  matrix(rnorm(500), ncol = 2),
  2,
  cumsum
)

library(bsvars)                               # load bsvars package

rw |>                                         # use rw data
  specify_bsvar$new(                          # specify the model
    stationary = rep(FALSE, 2)                # customise specification
  ) |>
  estimate(S = 100) |>                        # initial estimation
  estimate(S = 1000) ->                       # final estimation
  post                                        # store final estimation output

save(                                         # save the output
  post,                                       # chose post object
  file = paste0("bsvars_", iteration, ".rda") # file name
)
