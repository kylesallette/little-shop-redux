require 'csv'
require_relative '../app/models/merchant.rb'

class Seeds
  def self.from_csv(file_path)
    data = CSV.open file_path, headers: true, header_converters: :symbol, converters: :numeric
    data.each do |row|
      Merchant.create(row.to_hash)
    end
  end
end

Seeds.from_csv('data/merchants.csv')
