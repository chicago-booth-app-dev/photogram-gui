class UsersController < ApplicationController
  def index
    @users = User.all.order(:username)
    render({ :template => "user_templates/index.html.erb" })
  end

  def show
    username = params.fetch("path_username")
    @user = User.where({ :username => username }).first

    if @user == nil
      redirect_to("/404")
    else
      render({ :template => "user_templates/user.html.erb" })
    end
  end
end
