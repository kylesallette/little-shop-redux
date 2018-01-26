class CreateAutoincrement < ActiveRecord::Migration[5.1]
  def change
    execute "SELECT setval('merchants_id_seq', 12337411)"
  end
end
