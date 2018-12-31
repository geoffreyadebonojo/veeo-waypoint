class User::ResultsController < ApplicationController

  def show
    # @target_url = params[:target_url]
    @facade = SourceFacade.new(Source.new(source_params))
  end

  def new
  end

  private

  def source_params
    params.require(:source).permit(:display_url, :question_id, :snippet, :title, :url)
  end

end
