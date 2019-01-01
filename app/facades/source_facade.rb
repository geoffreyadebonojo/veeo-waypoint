class SourceFacade
  attr_reader :source

  def initialize(source)
    @source = source
  end

  def saved?
    source.persisted?
  end

  def question_id
    source.question_id
  end

  def question_text
    source.question.text
  end

  def new_note
    Note.new()
  end

  def notes
    source.notes.reverse
  end

  def source_params
    { question_id: source.question_id,
      url: source.url,
      title: source.title,
      snippet: source.snippet,
      display_url: source.display_url }
  end

  def topic_title
    source.topic.title
  end

  def topic
    source.topic
  end
end
