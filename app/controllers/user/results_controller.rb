class User::ResultsController < ApplicationController
  before_action :authenticate

  def show
    source = Source.find_or_initialize_by(source_params)
    @facade = SourceFacade.new(source)
  end

  private

  def source_params
    params.require(:source).permit(:display_url, :question_id, :snippet, :title, :url)
  end

end
