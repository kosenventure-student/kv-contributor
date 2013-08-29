class Users::RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    super
  end

  def update
    puts "\x1b[45m updated!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! \x1b[0m"

    super
  end

end