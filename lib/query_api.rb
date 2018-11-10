require 'net/http'

class QueryApi

  def initialize(http = Net::HTTP)
    @http = http
  end

  def all_purchases
    purchases_uri = URI('https://driftrock-dev-test.herokuapp.com/purchases')
    response = @http.get_response(purchases_uri)
  end

end
