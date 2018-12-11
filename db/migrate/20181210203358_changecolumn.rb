class Changecolumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :post_categories, :article_id
    add_column :post_categories, :post_id, :integer
  end
end
