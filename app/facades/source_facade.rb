class SourceFacade
  attr_reader :source

  def initialize(source)
    @source = source
  end

  def saved?
    false
  end

  def question
    source.question
  end

end
