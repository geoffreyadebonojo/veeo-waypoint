require 'rails_helper'

RSpec.describe Result do
  it "exists" do
    data = {}
    result = Result.new(data, 1)
    expect(result).to be_a(Result)
  end

  it "has attributes" do
    attributes = { url: "some url",
                   name: "A page or something",
                   display_url: 'some...url',
                   snippet: "this page would most likely have some text" }
    result = Result.new(attributes, 1)
    expect(result.url).to eq(attributes[:url])
    expect(result.title).to eq(attributes[:name])
    expect(result.display_url).to eq(attributes[:display_url])
    expect(result.snippet).to eq(attributes[:snippet])
  end
end
