require './lib/question'

class App

  def initialize(question = Question.new)
    @question = question
  end

end

question = Question.new

case ARGV[0]
when 'most_sold'
  puts question.most_sold
when 'total_spend'
  ARGV[1].nil? ? (puts 'Email required') : (puts question.total_spend(ARGV[1]))
when 'most_loyal'
  puts question.most_loyal
else
  puts 'Sorry, unknown question'
end

# if __file__ == $0
#   App.run
# end
