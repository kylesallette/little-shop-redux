require 'csv'
require_relative '../app/models/merchant.rb'
require_relative '../app/models/category.rb'
require_relative '../app/models/item.rb'

CSV.foreach('data/merchants.csv', headers: true, header_converters: :symbol, converters: :numeric) do |row|
  Merchant.create(row.to_hash)
end

CSV.foreach('data/categories.csv', headers: true, header_converters: :symbol, converters: :numeric) do |row|
  Category.create(row.to_hash)
end

CSV.foreach('data/items.csv', headers: true, header_converters: :symbol, converters: :numeric) do |row|
  Item.create(row.to_hash)
end
