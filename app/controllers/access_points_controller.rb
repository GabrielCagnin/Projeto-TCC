class AccessPointsController < ApplicationController
  before_action :set_access_point, only: [:show, :update, :destroy]

  # GET /access_points
  # GET /access_points.json
  def index
    @access_points = AccessPoint.all
  end

  # GET /access_points/1
  # GET /access_points/1.json
  def show
  end

  # POST /access_points
  # POST /access_points.json
  def create
    @access_point = AccessPoint.new(access_point_params)

    if @access_point.save
      render :show, status: :created, location: @access_point
    else
      render json: @access_point.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /access_points/1
  # PATCH/PUT /access_points/1.json
  def update
    if @access_point.update(access_point_params)
      render :show, status: :ok, location: @access_point
    else
      render json: @access_point.errors, status: :unprocessable_entity
    end
  end

  # DELETE /access_points/1
  # DELETE /access_points/1.json
  def destroy
    @access_point.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_access_point
    @access_point = AccessPoint.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def access_point_params
    params.require(:access_point).permit(:BSSID, :RSSI)
  end
end
