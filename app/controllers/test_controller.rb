class TestController < ApplicationController

  def user_facilities
    @facilities=User.find_by_id(1).facilities
    render json: @facilities
  end

end
