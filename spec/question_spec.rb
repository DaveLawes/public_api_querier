require 'question'

describe Question do

  let(:query_api) { double :query_api_double, all_purchases: '', all_users: '' }
  subject { described_class.new(query_api) }

  describe '#init' do
    it 'requests all purchases from query_api' do
      expect(query_api).to receive(:all_purchases)

      Question.new(query_api)
    end

    it 'requests all users from query_api' do
      expect(query_api).to receive(:all_users)

      Question.new(query_api)
    end
  end

  describe '#most_sold' do
    it 'returns the most sold item' do
      expect(subject.most_sold).to eq 'Heavy Duty Concrete Watch'
    end
  end

end
