class UsersController < ApplicationController
  respond_to :html

  def index
    @users = User.all_in
    respond_with @users.sort_by!{ |m| m.first_name }
  end

  def out
    @users = User.all_out
    respond_with @users.sort_by!{ |m| m.first_name }
  end
end
