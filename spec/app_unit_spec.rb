# unit tests for app.rb
require './app'

describe App do

  let(:question_double) { double Question }
  subject { described_class.new(question_double) }

  it 'Expect most_sold to be invoked on Question' do
    expect(question_double).to receive(:most_sold)

    subject.ask_question('most_sold')
  end

  it 'Expect total_spend to be invoked on Question with 1 argument' do
    expect(question_double).to receive(:total_spend).with('example@email.com')

    subject.ask_question('total_spend', 'example@email.com')
  end

  it 'Expect most_loyal to be invoked on Question' do
    expect(question_double).to receive(:most_loyal)

    subject.ask_question('most_loyal')
  end

  # edge cases
  # no email provided to total spend
  it 'Expect error to be raised in no email provided for total_spend' do
    expect { subject.ask_question('total_spend') }.to raise_error('Email required')
  end

  it 'Expect error to be raised if an unknown question is asked' do
    expect { subject.ask_question('most_purchased') }.to raise_error('Unknown question')
  end

end
