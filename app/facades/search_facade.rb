class SearchFacade
  attr_reader :question

  def initialize(question)
    @question = question
  end

  def results
    response = Faraday.get('request_url')
  end
end
