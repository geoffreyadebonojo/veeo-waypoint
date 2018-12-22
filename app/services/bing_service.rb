class BingService 
  
  def initialize(question)
    @question = question
  end
  
  def get_results
    JSON.parse(response.body, symbolize_names: true)[:webPages][:value]
  end 
  
  private
  
  def response 
    @response ||= conn.get('bing/v7.0/search') do |req|
      req.params['q'] = @question
      req.params['count'] = 10
      req.params['offset'] = 0
      req.params['mkt'] = 'en-us'
      req.params['safesearch'] = 'Moderate'
    end
  end
    
  def conn 
    Faraday.new('https://api.cognitive.microsoft.com/') do |faraday|
      faraday.headers['Ocp-Apim-Subscription-Key'] = ENV['BING_CLIENT_ID']
      faraday.adapter  Faraday.default_adapter
    end
  end 
end 