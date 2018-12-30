require 'rails_helper'

RSpec.describe User::SearchController, type: :controller do

  describe "GET #index" do
    let(:question) { "Not So Random Test Question?" }
    let(:facade) { double("SearchFacade") }

    before do
       allow(SearchFacade).to receive(:new).and_return(facade)
       allow(controller).to receive(:authenticate)
     end

    context "dependencies" do
      before { get :index, params: { question: question } }

      it { is_expected.to have_received(:authenticate) } # Spy
      it "should construct a SearchFacade" do
        expect(SearchFacade).to have_received(:new).with(question)
      end
    end

    describe "response" do
      subject(:response) { get :index, params: { question: question } }

      context "with successful authentication" do
        it { is_expected.to have_http_status(:success) }
      end

      context "with failed authentication" do
        before { allow(controller).to receive(:authenticate).and_call_original }
        it { is_expected.to have_http_status(:redirect) }
        it { is_expected.to redirect_to(login_path) }
      end
    end
  end
end
