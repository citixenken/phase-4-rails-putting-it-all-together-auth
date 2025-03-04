class UsersController < ApplicationController
skip_before_action :authorize, only: :create

    # signup feature
    def create 
        user = User.create!(user_params)
        if user.valid?
            session[:user_id] = user.id
            render json: user, status: :created
        else 
            render json: { error: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    # auto-login feature
    def show 
        # user = User.find_by(id: session[:user_id])
        # user = @current_user
        render json: @current_user, status: :created
    end

    private 
    def user_params 
        params.permit(:username, :password, :password_confirmation, :image_url, :bio)
    end

end
