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

    render json: response, status: :ok

    con.eval('rm(list=ls()')

  end

  def identify_zone
    @classification = QueuedClassification.new(identify_zone_params)

    @classification.save

    # Connect to Rserve
    con=Rserve::Connection.new

    # Change R to point to correct dir
    con.eval('setwd("~/machinelearning_R")')

    # Source all functions in Rserve workspace
    con.eval('source("serverFunctions.r")')

    response = con.eval('try(aws.SingleTest(queueID = "'+@classification.id+'",facilityID="'+@classification.facility_id+'"))')
    con.eval('rJava::.jstrVal(trainedModels$Tree$classifier')
    con.eval('rJava::.jstrVal(trainedModels$SMO$classifier')
    render json: response
    con.eval('rm(list=ls()')

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def identify_zone_params
    params.require(:queued_classification).permit(:id, :facility_id, {access_points: [:BSSID, :RSSI]})
  end


end
