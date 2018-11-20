# unit tests for app.rb
require './app'

describe App do

  let(:question_double) { double Question }
  subject { described_class.new(question_double) }

  it 'Expect most_sold to be invoked on Question' do
    expect(question_double).to receive(:most_sold)

    subject.most_sold
  end
  # expect(question_double).to receive(most_sold)
  # call most_sold on question
  # app('most_sold')

end
