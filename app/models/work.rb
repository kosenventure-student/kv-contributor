class Work < ActiveRecord::Base
  belongs_to :user
	attr_accessible :title, :content, :url, :user_id
end
