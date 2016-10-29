require 'rserve'
class ClassifyZoneController < ApplicationController

  def train_facility

    facility_id = params[:facility_id]
    # Connect to Rserve
    con=Rserve::Connection.new

    # Change R to point to correct dir
    con.eval('setwd("~/machinelearning_R")')

    # Source all functions in Rserve workspace
    con.eval('source("serverFunctions.r")')

    # first, prepare data with correct facility ID
    con.eval('aws.PrepareData('+facility_id+')')
    # then, we train the models
    response = con.eval('aws.trainModels('+facility_id+')')

    #con.eval('rm(list=ls()')


    render json: {'status': response}

  end

  def identify_zone

  end


end
