require 'csv'
class Seeds
  def self.from_csv(file_path)
    data = CSV.open file_path, headers: true, header_converters: :symbol, converters: :numeric
    data.each do |row|
      row
    end
  end
end

Seeds.from_csv('../data/merchants.csv')
