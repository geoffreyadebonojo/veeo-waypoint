class User::SourcesController < User::ApplicationController
  def show
    @source_url = source_params[:url]
    @source_params ||= source_params
  end

  def create
    question = Question.find(source_params[:question_id])
    if question.user == current_user
      Source.create(source_params)
    end
    redirect_to request.referrer
  end
end
