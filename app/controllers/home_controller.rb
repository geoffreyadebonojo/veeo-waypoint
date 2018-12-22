class HomeController < ApplicationController 
  
  def index
    redirect_to topics_path if current_user 
  end
end 