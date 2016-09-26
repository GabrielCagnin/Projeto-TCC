require 'rserve'
class ClassifyZoneController < ApplicationController

  def get_zone
    con=Rserve::Connection.new()
    render json: {'deu': 'certo'}
  end
end
