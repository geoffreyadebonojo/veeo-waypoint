class User::SearchController < ApplicationController
  before_action :authenticate

  def index
    @facade = SearchFacade.new(search_params[:question])
  end

  private
  def search_params
    params.permit(:question)
  end
end
