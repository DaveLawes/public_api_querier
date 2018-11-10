require './lib/question'

question = Question.new

case ARGV[0]
when 'most_sold'
  puts question.most_sold
else
  puts 'Sorry, unknown question'
end
