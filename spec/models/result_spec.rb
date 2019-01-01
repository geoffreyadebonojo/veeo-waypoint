require 'rails_helper'

RSpec.describe Result do
  let(:attributes) do
    { url: "some url",
      name: "A page or something",
      display_url: 'some...url',
      snippet: "this page would most likely have some text" }
  end
  let(:result) { Result.new(attributes, 1) }

  it "exists" do
    expect(result).to be_a(Result)
  end

  it "has attributes" do
    expect(result.url).to eq(attributes[:url])
    expect(result.title).to eq(attributes[:name])
    expect(result.display_url).to eq(attributes[:display_url])
    expect(result.snippet).to eq(attributes[:snippet])
  end
  describe 'instance methods' do
    describe 'source_params' do
      it 'returns a hash of parameters' do
        params = { question_id: 1,
                   url: "some url",
                   title: "A page or something",
                   display_url: 'some...url',
                   snippet: "this page would most likely have some text" }
        expect(result.source_params).to eq(params)
      end
    end
  end
end
