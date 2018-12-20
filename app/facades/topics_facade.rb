class TopicsFacade
  def initialize(user)
    @user = user
  end

  def topics
    @user.topics
  end

  def new_question
    Question.new
  end
end
