class User::SearchController < User::ApplicationController
  def index
    question = Question.find(search_params[:question_id])
    @facade = SearchFacade.new(question)
  end

  private
  def search_params
    params.permit(:question_id)
  end
end
