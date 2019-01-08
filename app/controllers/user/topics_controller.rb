class User::TopicsController < User::ApplicationController
  def index
    @facade = TopicsFacade.new(current_user)
  end

  def show
    @facade = TopicsFacade.new(current_user)
    @topic = Topic.find(params[:id])
  end

  def create
    current_user.topics.create(topic_params)
    redirect_to topics_path
  end

  def update
    topic = Topic.find(params[:id])
    topic.update(topic_params)
    redirect_to topics_path
  end

  def destroy
    Topic.find(params[:id]).destroy
    redirect_to topics_path
  end

  def topic_params
    params.require(:topic).permit(:title)
  end
end
