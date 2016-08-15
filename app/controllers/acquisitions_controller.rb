class AcquisitionsController < ApplicationController

  def show_all

    if params[:zone_id] != nil and params[:acquisition_set_id] != nil
      render json: 'The request should not have zone_id and acquisition_set_id simultaneously',
             status: :unprocessable_entity

    elsif params[:zone_id] != nil
      @acquisitions = Zone.find(params[:zone_id]).acquisitions
      render json: @acquisitions, status: :ok

    elsif params[:acquisition_set_id] != nil
      @acquisitions = AcquisitionSet.find(params[:acquisition_set_id]).acquisitions
      render json: @acquisitions, status: :ok

    else
      render json: 'You need a zone_id or an acquisition_set_id',
             status: :unprocessable_entity

    end
  end

end
