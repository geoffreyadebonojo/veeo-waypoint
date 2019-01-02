class SourceFacade < SimpleDelegator
  attr_reader :source

  def initialize(source)
    @source = source
    super(source)
  end

  def saved?
    persisted?
  end

  def question_text
    question.text
  end

  def new_note
    Note.new()
  end

  def source_params
    { question_id: source.question_id,
      url: source.url,
      title: source.title,
      snippet: source.snippet,
      display_url: source.display_url }
  end

  def topic_title
    topic.title
  end
end
