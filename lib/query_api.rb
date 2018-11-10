require 'net/http'
require 'json'

class QueryApi

  def initialize(http = Net::HTTP)
    @http = http
  end

  def all_purchases
    purchases_uri = URI('https://driftrock-dev-test.herokuapp.com/purchases')
    response = @http.get_response(purchases_uri)
    data = JSON.parse(response.body)
    data['data']
  end

  def all_users
    users_uri = URI('https://driftrock-dev-test.herokuapp.com/users')
    response = @http.get_response(users_uri)
    data = JSON.parse(response.body)
    data['data']
  end

end
