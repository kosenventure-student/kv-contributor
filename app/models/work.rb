class Work < ActiveRecord::Base
  belongs_to :user_id
	attr_accessible :title, :content, :url
end
