class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		if @user.save
			flash[:success] = Sign up successful
			redirect_to root_path
		else
			render 'new'
		end
	end

	private

		def user_params
			params.require(:user).permit(:username, :password, :password_confirmation)
		end

end
