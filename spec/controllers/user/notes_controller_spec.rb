require 'rails_helper'

RSpec.describe User::NotesController, type: :controller do

  describe "POST #create" do
    before do
      allow(controller).to receive(:authenticate)
      allow(Source).to receive(:find).and_return(build_stubbed(:source, id: 1))
      request.env['HTTP_REFERER'] = "/"
    end

    subject(:response) do
      post :create, params: { note: {text: "New Note"}, source_id: 1 } 
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
