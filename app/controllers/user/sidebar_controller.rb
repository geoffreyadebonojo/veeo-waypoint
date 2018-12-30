class User::SidebarController < ApplicationController

  def index
    @title = session[:source_title]
    @url = session[:source_url]
    @question = session[:question_title]
  end

end