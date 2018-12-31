class User::SourcesController < ApplicationController
  before_action :authenticate

  def create
    question = Question.find(source_params[:question_id])
    if question.user == current_user
      Source.create(source_params)
    end
  end

  private

  def source_params
    @source_params ||= params.require(:source).permit(:display_url, :question_id, :snippet, :title, :url)
  end
end
