class Api::CoursesController < ApplicationController
  before_action  :doorkeeper_authorize!
  before_action :set_user
  def index
    @courses = Course.all
  end
  private
    def set_user
      @user = User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    end
end