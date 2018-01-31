class AddAutoIncrementToItemId < ActiveRecord::Migration[5.1]
  def change
    execute "SELECT setval('items_id_seq', 263567474)"
  end
end
