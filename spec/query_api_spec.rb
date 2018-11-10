require 'query_api'

describe QueryApi do

  response = Net::HTTPSuccess.new(1.0, '200', 'OK')
  let(:http) { double :http_double, get_response: response }
  subject { described_class.new(http) }

  describe '#all_purchases' do

    purchases_uri = URI('https://driftrock-dev-test.herokuapp.com/purchases')

    it 'makes a get request to correct url' do
      expect(http).to receive(:get_response).with(purchases_uri)

      subject.all_purchases
    end
  end

end
