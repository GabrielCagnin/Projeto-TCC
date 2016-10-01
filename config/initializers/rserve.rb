require 'rserve'

# Connect to Rserve
::Rserve_con=Rserve::Connection.new

# Change R to point to correct dir
Rserve_con.eval('setwd("~/server_api")')

# Source all functions in Rserve workspace
Rserve_con.eval('source("serverFunctions.r")')