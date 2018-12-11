class Topic < ApplicationRecord
  has_many :categories
  has_many :posts

end
