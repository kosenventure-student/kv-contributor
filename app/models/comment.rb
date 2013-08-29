class Comment < ActiveRecord::Base
  belongs_to :user
  attr_accessible :title, :content
end
