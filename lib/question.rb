class Question

  def initialize(query_api = QueryApi.new)
    @all_purchases = query_api.all_purchases
    @all_users = query_api.all_users
  end

end
