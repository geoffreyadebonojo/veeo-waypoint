class User::QuestionsController < User::ApplicationController
  # before_action :authenticate

  def create
    topic = Topic.find(params[:topic_id])
    valid_user = (current_user == topic.user)
    valid_user && question = topic.questions.create(question_params)
    # redirect_to topics_path
    redirect_to request.referrer
  end

  def destroy
    Question.find(params[:id]).destroy
    redirect_to request.referrer
  end

  private

  def question_params
    params.require(:question).permit(:text)
  end
end
