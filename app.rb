require './lib/question'

question = Question.new

case ARGV[0]
when 'most_sold'
  puts question.most_sold
when 'total_spend'
  if ARGV[1].nil?
    puts 'Please provide an email'
  else
    puts question.total_spend(ARGV[1])
  end
when 'most_loyal'
  puts question.most_loyal
else
  puts 'Sorry, unknown question'
end
