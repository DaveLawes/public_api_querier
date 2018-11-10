class Question

  def initialize(query_api = QueryApi.new)
    @all_purchases = query_api.all_purchases
    @all_users = query_api.all_users
  end

  def most_sold
    all_items = @all_purchases.map { |element| element['item'] }
    mapped = all_items.each_with_object(Hash.new(0)) do |element, value|
      value[element] += 1
    end
    sorted = mapped.sort_by { |k, v| v }.reverse
    sorted[0][0]
  end

end
