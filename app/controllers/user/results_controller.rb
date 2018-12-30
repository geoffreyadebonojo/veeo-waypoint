class User::ResultsController < ApplicationController

  def index
    @facade = SearchFacade.new(search_params)
  end

  private

  def search_params
    params.permit(:question)
  end
end
