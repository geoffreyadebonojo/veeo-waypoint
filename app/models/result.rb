class Result
  attr_reader :url,
              :title,
              :snippet,
              :display_url

  def initialize(data, question_id)
    @question_id        = question_id
    @url                = data[:url]
    @title              = data[:name]
    @snippet            = data[:snippet]
    @display_url        = data[:display_url]
  end

  def source_params
    {
      question_id: @question_id,
      url: @url,
      title: @title,
      snippet: @snippet,
      display_url: @display_url
    }
  end

end
