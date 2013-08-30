class UserGreetersController < ApplicationController
  def greet
    userinfo_ = params[:uid]
    @userinfo = User.find_by(:id => userinfo_.to_i)
    if @userinfo == nil
      render :text => "#{params[:uid]}"
    end
  end
end
