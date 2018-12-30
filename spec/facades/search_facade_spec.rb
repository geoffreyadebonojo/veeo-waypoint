require 'rails_helper'

RSpec.describe SearchFacade do
  let(:question)   { "Is this a random example queston?" }
  let(:facade) { SearchFacade.new(question)}
  scenario { expect(facade).to be_instance_of SearchFacade }

  describe "instance methods" do

    describe "results" do
      let(:raw_result) { "Result 0" }
      let(:result)     { double(raw_result) }
      let(:service)    { double("BingService", get_results: [raw_result]) }

      before do
        allow(Result).to receive(:new).with(raw_result).and_return(result)
        allow(BingService).to receive(:new).with(question).and_return(service)
      end

      it 'should create and return Result objects' do
        expect(facade.results).to eq([result])
        expect(Result).to have_received(:new).with(raw_result)
      end
    end
  end
end
