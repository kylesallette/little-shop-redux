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
  Item.create(id:          row[:id],
              name:        row[:name],
              description: row[:description],
              unit_price:  row[:unit_price],
              merchant_id: row[:merchant_id],
              created_at:  row[:created_at],
              updated_at:  row[:updated_at])
end
