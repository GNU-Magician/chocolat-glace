class Post < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |field|
      field.string :title
    end
  end
end
