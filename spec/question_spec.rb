require 'question'

describe Question do

  purchases = JSON.parse(File.read('./spec/test_data/all_purchases.json'))["data"]
  users = JSON.parse(File.read('./spec/test_data/all_users.json'))["data"]

  let(:query_api) { double :query_api_double, all_purchases: purchases, all_users: users }
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

  describe '#total_spend' do
    context 'given email exists within users data' do
      it 'returns the total spend for the user email provided' do
        expect(subject.total_spend('schimmel_quincy@ernser.io')).to eq 245.01
      end
    end

    context 'given email does not exist within users data' do
      it 'raises an error to alert the user' do
        expect { subject.total_spend('dave@test.co') }.to raise_error('Email not included in data')
      end
    end

  end

  describe '#most_loyal' do
    it 'returns the email address of the most loyal customer' do
      expect(subject.most_loyal).to eq 'travis_kshlerin@wunsch.net'
    end
  end

end
