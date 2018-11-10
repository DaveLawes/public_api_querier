#!/usr/bin/env ruby
require './lib/question'

question = Question.new

case ARGV[0]
when 'most_sold'
  puts question.most_sold
else
  puts 'not a valid selection'
end
