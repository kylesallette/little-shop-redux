class CreateAddCategoryIdToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :category_id, :integer
#     add_column :items, :image_id, :integer
  end
end
