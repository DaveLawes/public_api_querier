require 'net/http'
require 'json'

class QueryApi

  def initialize(http = Net::HTTP)
    @http = http
  end

  def all_purchases
    body = getResponseBody('https://driftrock-dev-test.herokuapp.com/purchases')
    body['data']
  end

  def all_users
    body = getResponseBody('https://driftrock-dev-test.herokuapp.com/users')
    body['data']
  end

  private

  def getResponseBody(url)
    uri = URI(url)
    response = @http.get_response(uri)
    JSON.parse(response.body)
  end

end
