class Form < ActiveRecord::Base
  has_many :posts
  belongs_to :customer
end
