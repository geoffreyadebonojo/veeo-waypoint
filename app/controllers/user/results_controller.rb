class User::ResultsController < ApplicationController

  def show
    @target_url = params[:target_url]
  end

  private

  def search_params
    params.permit(:question)
  end
end
