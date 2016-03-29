class PointsController < ApplicationController
  before_action :set_point, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create]

  # GET /points/zone/:zone_id
  def show_zone_points
    zone=Zone.find_by_id(params[:zone_id])
    points = zone.points

    render json: points
  end


  # POST /points
  def create
    point = Point.new(point_params)
    zone_id=point_params[:zone_id]
    if zone_id.nil?
      render body: 'No zone id'
    else
      if Zone.find_by_id(zone_id)
        if Zone.find_by_id(zone_id).points.where(count: point_params[:count]).empty?
          if point.save
            render body: "Point '"+point.count.to_s+"' was created.", status: :created
          else
            render body: 'Error: point was not created', status: :unprocessable_entity
          end
        else
          render body: "Point '"+point.count.to_s+"' already exists in this zone."
        end
      else
        render body: 'Zone with id '+zone_id.to_s+' does not exist'
      end
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
