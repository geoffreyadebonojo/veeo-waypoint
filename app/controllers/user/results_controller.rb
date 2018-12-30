class User::ResultsController < ApplicationController

  def show
    @target_url = params[:target_url]
  end

end
