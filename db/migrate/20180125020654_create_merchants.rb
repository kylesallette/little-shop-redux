class CreateMerchants < ActiveRecord::Migration[5.1]
  def change
    create_table :merchants do |t|
      t.string   :merchant_id
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps null: false
    end
  end
end
