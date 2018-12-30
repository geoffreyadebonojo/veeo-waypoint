require 'rails_helper'

RSpec.describe User::QuestionsController, type: :controller do
  let(:question) { "Is this yet another test question?" }
  let(:user)     { build_stubbed(:user) }
  let(:topic)    { build_stubbed(:topic, user: user) }
  before do
    allow(topic.questions)
      .to receive(:create)
      .with(text: question)
      .and_return(build_stubbed(:question, topic:topic))
  end

  describe "POST #create" do
    before { post :create, params: { topic_id: topic.id} }

    it { binding.pry }
    # describe "create" do
    #
    #   subject(:response) { post :create, params: { topic_id: topic_id} }
    #
    #   context "with successful authentication" do
    #     it { is_expected.to have_http_status(:success) }
    #   end
    #
    #   context "with failed authentication" do
    #     before { allow(controller).to receive(:authenticate).and_call_original }
    #     it { is_expected.to have_http_status(:redirect) }
    #     it { is_expected.to redirect_to(login_path) }
    #   end
    # end
  end
end
