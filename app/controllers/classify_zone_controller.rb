require 'rserve'
class ClassifyZoneController < ApplicationController

  def get_zone

    require 'rserve'

# Connect to Rserve
    con=Rserve::Connection.new

# Change R to point to correct dir
    con.eval('setwd("~/machinelearning_R")')

# Source all functions in Rserve workspace
    con.eval('source("serverFunctions.r")')


    #first, prepare data with correct facility ID
    x=con.eval('aws.PrepareData("57b6043d19e3c17d5ac586ef")')
    #then, we train the models
    y=con.eval('aws.trainModels("57b6043d19e3c17d5ac586ef")')

    render json: x

  end
end
