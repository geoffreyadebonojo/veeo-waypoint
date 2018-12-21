class Result
  attr_reader :url,
              :title,
              :snippet,
              :display_url

  def initialize(data)
    @url         = data[:url]
    @title       = data[:name]
    @snippet     = data[:snippet]
    @display_url = data[:display_url]
  end
end
