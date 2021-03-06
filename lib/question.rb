require './lib/query_api'

class Question

  def initialize(query_api = QueryApi.new)
    @query_api = query_api

    @all_users = query_api.all_users
  end

  def most_sold
    # raise('API not ok') if apiStatusOk?

    items = map_purchases_by_property('item')
    find_most_common(items)
  end

  def total_spend(email)
    user_id = find_by('email', email, 'id')
    raise('Email not included in data') if user_id.nil?

    calculate_total_spend(user_id)
  end

  def most_loyal
    ids = map_purchases_by_property('user_id')
    user_id = find_most_common(ids)
    find_by('id', user_id, 'email')
  end

  private

  def all_purchases
    @all_purchases ||= @query_api.all_purchases
  end

  def map_purchases_by_property(property)
    all_purchases.map { |purchase| purchase[property] }
  end

  def find_most_common(array)
    mapped = array.each_with_object(Hash.new(0)) { |k, v| v[k] += 1 }
    sorted = mapped.sort_by { |_, v| v }.reverse
    sorted[0][0]
  end

  def find_by(property, value, return_property)
    found = nil
    @all_users.each do |user|
      found = user[return_property] if user[property] === value
    end
    found
  end

  def calculate_total_spend(user_id)
    total_spend = 0
    all_purchases.each do |item|
      total_spend += item['spend'].to_f if item['user_id'] == user_id
    end
    total_spend
  end

end
