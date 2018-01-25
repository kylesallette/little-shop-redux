class Merchant < ActiveRecord::Base
  validates_uniqueness_of :merchant_id
  validates_presence_of   :merchant_id,
                          :name,
                          :created_at,
                          :updated_at
end
