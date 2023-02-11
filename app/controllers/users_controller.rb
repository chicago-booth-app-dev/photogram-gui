class UsersController < ApplicationController
  def index
    @users = User.all.order(:username)
    render({ :template => "user_templates/index.html.erb" })
  end

  def show
    username = params.fetch("path_username")
    @user = User.where({ :username => username }).first

    render({ :template => "user_templates/user.html.erb" })
  end

  def add
    username = params.fetch("username")

    user = User.new
    user.username = username
    user.save

    redirect_to("/users/" + user.username)
  end

  def update
    username = params.fetch("username")
    user_id = params.fetch("user_id")

    user = User.where({ :id => user_id }).first
    user.username = username
    user.save

    redirect_to("/users/" + user.username)
  end
end
