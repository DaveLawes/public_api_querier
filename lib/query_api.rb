require 'net/http'
require 'json'

class QueryApi

  def initialize(http = Net::HTTP)
    @http = http
  end

  def all_purchases
    body = get_response_body('https://driftrock-dev-test.herokuapp.com/purchases')
    body['data']
  end

  def all_users
    body = get_response_body('https://driftrock-dev-test.herokuapp.com/users')
    body['data']
  end

  # I didn't DRY the above functions out further because different response
  # bodies have a different data structure. E.g. for [api]/status I would want
  # to return body['status']

  private

  def get_response_body(url)
    uri = URI(url)
    response = @http.get_response(uri)
    raise('HTTP response not a success') unless response.is_a?(Net::HTTPSuccess)

    JSON.parse(response.body)
  end

end
