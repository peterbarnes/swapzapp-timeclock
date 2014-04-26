class UsersController < ApplicationController
  respond_to :html

  def index
    @users = User.all(params)
    respond_with @users.sort_by!{ |m| m.first_name }
  end
end
