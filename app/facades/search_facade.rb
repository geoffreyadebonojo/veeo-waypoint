class SearchFacade
  attr_reader :question

  def initialize(question)
    @question = question
  end

  def results
    search_results.map do |raw_result|
      Result.new(raw_result)
    end
  end
  
  private 
  
  def search_results
    @results ||= bing_service.get_results
  end
  
  def bing_service
    BingService.new(@question)
  end
end
