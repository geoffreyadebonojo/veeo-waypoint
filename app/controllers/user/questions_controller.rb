class User::QuestionsController < ApplicationController

  def create
    topic = Topic.find(params[:topic_id])
    valid_user = (current_user == topic.user)
    valid_user && question = topic.questions.create(question_params)
    redirect_to topics_path
  end

  private

  def question_params
    params.require(:question).permit(:text)
  end
end