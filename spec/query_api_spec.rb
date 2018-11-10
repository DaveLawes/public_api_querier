require 'query_api'

describe QueryApi do

  response = Net::HTTPSuccess.new(1.0, '200', 'OK')
  unsuccessful_response = Net::HTTPClientError.new(1.0, '404', 'NOT OK')
  let(:http) { double :http_double, get_response: response }
  subject { described_class.new(http) }

  describe '#all_purchases' do
    purchases_uri = URI('https://driftrock-dev-test.herokuapp.com/purchases')
    purchases = File.read('./spec/test_data/all_purchases.json')

    before do
      allow(response).to receive(:body).and_return(purchases)
    end

    it 'makes a get request to correct url' do
      expect(http).to receive(:get_response).with(purchases_uri)

      subject.all_purchases
    end

    context 'given HTTP response is successful' do
      it 'returns the body of the response in json format' do
        http_body = JSON.parse(purchases)
        expected_return = http_body['data']

        expect(subject.all_purchases).to eq expected_return
      end
    end

    context 'given the HTTP response is not successful' do
      it 'raises an error' do
        allow(http).to receive(:get_response).and_return(unsuccessful_response)

        expect { subject.all_purchases }.to raise_error('HTTP response not successful')
      end
    end

  end

  describe '#all_users' do
    users_uri = URI('https://driftrock-dev-test.herokuapp.com/users')
    users = File.read('./spec/test_data/all_users.json')

    before do
      allow(response).to receive(:body).and_return(users)
    end

    it 'makes a get request to the correct url' do
      expect(http).to receive(:get_response).with(users_uri)

      subject.all_users
    end
  end

end
