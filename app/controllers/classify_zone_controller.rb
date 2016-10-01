require 'rserve'
class ClassifyZoneController < ApplicationController

  def get_zone


    #first, prepare data with correct facility ID
    x=Rserve_con.eval('aws.PrepareData("57b6043d19e3c17d5ac586ef")')
    #then, we train the models
    y=Rserve_con.eval('aws.trainModels("57b6043d19e3c17d5ac586ef")')

    render json: x

  end
end
