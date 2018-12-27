class User::ResultsController < ApplicationController

  def index
    @facade = SearchFacade.new(search_params)
  end

  def search_params
    params.permit(:question)
  end
end
