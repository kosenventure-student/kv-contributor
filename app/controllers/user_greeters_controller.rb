class UserGreetersController < ApplicationController
  def greet
    userinfo_ = params[:uid]
    @userinfo = User.find_by(:id => userinfo_.to_i)
    if @userinfo == nil
      render :text => "不明なユーザ：#{params[:uid]}"
    end
  end

  def home
    @posts = Post.find_by_sql("SELECT * FROM posts ORDER BY created_at DESC LIMIT 10")
    @works = Work.find_by_sql("SELECT * FROM works ORDER BY created_at DESC LIMIT 10")
  end
  def my
    @my_works_raw = Work.find_by_sql("select * from works where user_id = "+current_user.id.to_s)
    @my_posts_raw = Post.find_by_sql("select * from posts where user_id = "+current_user.id.to_s)
    @my_comments_raw = Comment.find_by_sql("select * from comments where user_id = "+current_user.id.to_s)
  end
end
