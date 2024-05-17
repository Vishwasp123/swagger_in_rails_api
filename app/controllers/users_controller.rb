class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :set_user, only: %i[show update destroy]

	def index
		@users = User.all 
		render json: @users 
	end

	def show
		render json: @user
	end 

	def create 
		@user = User.create(user_params) 

		if @user.save
			render json: @user
		else
			render json: @user.errors, status: :unprocessable_entity
		end
	end

	def update
		if @user.update(user_params)
			render json: {messages: "user update",user: @user.name }
		else
			render json: @user.errors, status: :unprocessable_entity
		end
	end

	def destroy
		if @user.destroy
			render	json: {messages: "User destroy succefully", user: @user.name}
		end
	end

	private
	def  set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:name, :address, :age)
	end
end
