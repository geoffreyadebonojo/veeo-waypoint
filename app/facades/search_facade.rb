class SearchFacade
  attr_reader :question

  def initialize(question)
    @question = question
  end

  def results
    conn = Faraday.new('https://api.cognitive.microsoft.com/') do |faraday|
      faraday.headers['Ocp-Apim-Subscription-Key'] = ENV['BING_CLIENT_ID']
      faraday.adapter  Faraday.default_adapter
    end

    response = conn.get('bing/v7.0/search') do |req|
      req.params['q'] = @question
      req.params['count'] = 10
      req.params['offset'] = 0
      req.params['mkt'] = 'en-us'
      req.params['safesearch'] = 'Moderate'
    end

    data = JSON.parse(response.body, symbolize_names: true)[:webPages][:value]
    @results = data.map do |raw_result|
      Result.new(raw_result)
    end
  end
end
