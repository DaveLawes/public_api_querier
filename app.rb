require './lib/question'

class App

  def initialize(question = Question.new)
    @question = question
  end

  def ask_question(question, email = nil)
    # @question.checkAPI

    case question
    when 'most_sold'
      most_sold
    when 'total_spend'
      total_spend(email)
    when 'most_loyal'
      most_loyal
    else
      raise('Unknown question')
    end
  end

  private

  def most_sold
    @question.most_sold
  end

  def most_loyal
    @question.most_loyal
  end

  def total_spend(email)
    raise('Email required') if email.nil?

    @question.total_spend(email)
  end

end

if __FILE__ == $0
  begin
    app = App.new
    puts app.ask_question(ARGV[0], ARGV[1])
  rescue => error
    puts error
  end
end
