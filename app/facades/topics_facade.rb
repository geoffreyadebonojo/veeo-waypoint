class TopicsFacade

  def initialize(user)
    @user = user
  end

  def topics
    @user.topics
  end

  def new_topic
    Topic.new
  end

  def new_question
    Question.new
  end
end
