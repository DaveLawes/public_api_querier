require './lib/question'

question = Question.new

case ARGV[0]
when 'most_sold'
  puts question.most_sold
when 'total_spend'
  puts question.total_spend(ARGV[1])
else
  puts 'Sorry, unknown question'
end
