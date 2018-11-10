require 'question'

describe Question do

  let(:query_api) { double :query_api_double, all_purchases: '', all_users: '' }

  describe '#init' do
    it 'requests all purchases from query_api' do
      expect(query_api).to receive(:all_purchases)

      question = Question.new(query_api)
    end
  end

end
