# require 'rails_helper'
#
# RSpec.describe User::QuestionsController, type: :controller do
#   describe "GET #index" do
#     # let(:question) { "Not So Random Test Question?" }
#     # let(:topic) { double("Topic", questions) }
#
#     let(:topic_id) { 1 }
#
#     before do
#       topic =
#       questions_double = double("Questions", create: )
#       topic_double = double("Topic", questions: questions_double)
#       allow(Topic).to receive(:find).with(topic_id).and_return(topic_double)
#       allow(controller).to receive(:authenticate)
#     end
#
#     # context "dependencies" do
#     #   before { get :index, params: { question: question } }
#     #
#     #   it { is_expected.to have_received(:authenticate) } # Spy
#     #   it "should construct a SearchFacade" do
#     #     expect(SearchFacade).to have_received(:new).with(question)
#     #   end
#     # end
#
#     describe "create" do
#
#       subject(:response) { post :create, params: { topic_id: topic_id} }
#
#       context "with successful authentication" do
#         it { is_expected.to have_http_status(:success) }
#       end
#
#       context "with failed authentication" do
#         before { allow(controller).to receive(:authenticate).and_call_original }
#         it { is_expected.to have_http_status(:redirect) }
#         it { is_expected.to redirect_to(login_path) }
#       end
#     end
#   end
# end
