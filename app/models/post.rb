class Post < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  has_many :post_categories
  has_many :categories, :through => :post_categories

end
