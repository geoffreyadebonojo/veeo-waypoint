class User::ResultsController < ApplicationController

  def show
    @target_url = params[:target_url]
    @facade = SourceFacade.new(source_params)
  end

end
