class HomeController < ApplicationController

  def index
    redirect_to topics_path if current_user
    render layout: 'login'
  end
end
