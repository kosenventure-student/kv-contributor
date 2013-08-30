class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :content, :presence => true

  attr_accessible :title, :content, :user_id
  def page
    "posts/" + self.post_id.to_s
  end
  def post_origin
    post.title
  end
end
