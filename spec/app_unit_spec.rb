# unit tests for app.rb
require './app'

describe App do

  let(:question_double) { double Question }
  subject { described_class.new(question_double) }

  it 'Expect most_sold to be invoked on Question' do
    expect(question_double).to receive(:most_sold)

    subject.most_sold
  end

  it 'Expect total_spend to be invoked on Question with 1 argument' do
    expect(question_double).to receive(:total_spend).with('example@email.com')

    subject.total_spend('example@email.com')
  end

  it 'Expect most_loyal to be invoked on Question' do
    expect(question_double).to receive(:most_loyal)

    subject.most_loyal
  end


end
