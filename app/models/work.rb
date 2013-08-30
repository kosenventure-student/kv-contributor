class Work < ActiveRecord::Base
  belongs_to :user
    attr_accessible :title, :content, :url, :user_id
  def page
    "works/" + self.id.to_s
  end
end
