class User::TopicsController < ApplicationController
  before_action :authenticate

  def create
  end

  def index
    @facade = DashboardFacade.new(current_user)
  end

  def show
  end
end
