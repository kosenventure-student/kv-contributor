class Post < ActiveRecord::Base

	has_many :comments

  belongs_to :user_id

	attr_accessible :title, :content, :post_id
end
