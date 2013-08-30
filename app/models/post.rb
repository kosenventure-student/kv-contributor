class Post < ActiveRecord::Base

  has_many :comments

  belongs_to :user

  attr_accessible :title, :content, :post_id, :user_id
  def page
    "posts/" + self.id.to_s
  end
end
