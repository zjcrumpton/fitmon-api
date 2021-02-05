class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :auto_login]

    before_action :authorized, only: [:auto_login]



    # GET /auth/auto_login
    def auto_login
        render json: @user
    end

    # POST /users
    def create
        @user = User.create(user_params)
        if @user.valid?
            @token = encode_token(user_id: @user.id)
            render json: { user: @user, token: @token }
        else  
            render json: { error: 'Invalid username or password' }, status: :unauthorized
        end
    end

    # POST /login
    def login
            @user = User.find_by(username: params[:username])
    
        if @user && @user.authenticate(params[:password])
            token = encode_token({user_id: @user.id})
            render json: {user: @user, token: token}
        else
            render json: {error: "Invalid username or password"}, status: :unauthorized
        end
    end


    private

    def user_params
        params.require(:user).permit(:username, :password, :email, :goal, :days_per_week, 
                      :gender, :age, :weight, :height, :experience)
    end
end
