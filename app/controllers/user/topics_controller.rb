class User::TopicsController < ApplicationController
  before_action :authenticate

  def create
    @topic = current_user.topics.create(topic_params)
    redirect_to topics_path
  end

  def index
    @facade = DashboardFacade.new(current_user)
  end

  def show
  end
  
  private 
  
  def topic_params
    params.require(:topic).permit(:title)
  end
end
