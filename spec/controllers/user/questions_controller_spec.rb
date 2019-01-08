require 'rails_helper'

RSpec.describe User::QuestionsController, type: :controller do
  let(:question) { "Is this yet another test question?" }
  let(:user)     { build_stubbed(:user) }
  let(:topic)    { build_stubbed(:topic, user: user) }

  before { allow(controller).to receive(:authenticate) }

  describe "POST #create" do
    before do
      allow(Topic).to receive(:find).and_return(topic)
      allow(topic.questions)
        .to receive(:create)
        .with(text: question)
        .and_return(build_stubbed(:question, topic: topic))
      request.env['HTTP_REFERER'] = "/"
    end
    subject(:response) { post :create, params: { topic_id: topic.id} }
    describe "response" do
      context "with successful authentication" do
        it { is_expected.to have_http_status(:redirect) }
      end

      context "with failed authentication" do
        before { allow(controller).to receive(:authenticate).and_call_original }
        it { is_expected.to have_http_status(:redirect) }
        it { is_expected.to redirect_to(login_path) }
      end
    end
  end
  describe "DELETE #destroy" do
    let(:question) { build_stubbed(:question) }
    before do
      allow(Question).to receive(:find).and_return(question)
      allow(question).to receive(:destroy)
      request.env['HTTP_REFERER'] = "/"
    end
    subject(:response) { delete :destroy, params: { id: question.id} }
    it "should delete the question" do
      delete :destroy, params: { id: question.id}
      expect(Question).to have_received(:find)
      expect(question).to have_received(:destroy)
    end
    describe "response" do
      context "with successful authentication" do
        it { is_expected.to have_http_status(:redirect) }
      end

      context "with failed authentication" do
        before { allow(controller).to receive(:authenticate).and_call_original }
        it { is_expected.to have_http_status(:redirect) }
        it { is_expected.to redirect_to(login_path) }
      end
    end
  end

end
