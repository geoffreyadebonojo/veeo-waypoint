class User::SourcesController < ApplicationController

  def index
  end

  def show
    @topic = Topic.find(params[:topic_id])
  end

  def new
  end

  def create
    topic = Topic.find(params[:topic_id])
    question = topic.questions.find(params[:question_id])

    source = question.sources.create(source_params)

    source_url = params[:target_url]
    source_title = params[:target_title]

    valid_user = (current_user == topic.user)
    valid_user && source

    source.title = source_title
    source.url = source_url

    source.save
  end

  private

  def source_params
    params.permit(:source)
  end

end
