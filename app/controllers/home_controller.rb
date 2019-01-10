class HomeController < ApplicationController

  def index
    redirect_to topics_path if current_user
    # binding.pry
    render layout: 'login' unless performed?
  end
end
