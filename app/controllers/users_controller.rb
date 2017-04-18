class UsersController < ApplicationController
	before_action :authenticate_user!
	
  def show
		@user = User.find(params[:id])
		@items = @user.items
		@item = Item.new
		@item.user = current_user
  end
end
