class User::ApplicationController < ApplicationController
  before_action :authenticate
  helper_method :source_params

  def source_params
    params.require(:source).permit(:display_url, :question_id, :snippet, :title, :url)
  end
end
