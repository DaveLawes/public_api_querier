require 'query_api'

describe QueryApi do

  response = Net::HTTPSuccess.new(1.0, '200', 'OK')
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

    it 'returns the body of the response in json format' do
      http_body = JSON.parse(purchases)
      expected_return = http_body['data']

      expect(subject.all_purchases).to eq expected_return
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
