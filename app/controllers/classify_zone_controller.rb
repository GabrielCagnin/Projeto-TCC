require 'rserve'
class ClassifyZoneController < ApplicationController

  def get_zone
    con=Rserve::Connection.new

    x=con.eval('aws.PrepareData("57b6043d19e3c17d5ac586ef")')
    render json: x
  end
end
