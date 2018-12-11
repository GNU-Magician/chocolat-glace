class AddTopicIdToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :topic_id, :integer
  end
end
