class PointsController < ApplicationController
  before_action :set_point, only: [:show, :update, :destroy]


  # GET /points/zone/:zone_id
  def show_zone_points
    points = Point.find(params[:zone_id])

    render json: points
  end


  # POST /points
  def create
    point = Point.new(point_params)

    if @point.save
      render body: "Point '"+point.name+"' was created.", status: :created, location: @point
    else
      render body: 'Error: point was not created', status: :unprocessable_entity
    end
  end

  # PATCH/PUT /points/1
  def update
    if @point.update(point_params)
      render json: @point
    else
      render json: @point.errors, status: :unprocessable_entity
    end
  end

  # DELETE /points/1
  def destroy
    @point.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
    def set_point
      @point = Point.find(params[:id])
    end

  # Only allow a trusted parameter "white list" through.
    def point_params
      params.require(:point).permit(:count, :zone_id)
    end
end
