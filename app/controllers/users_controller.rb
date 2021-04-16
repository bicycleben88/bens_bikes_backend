class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]

    def create
      @user = User.new(user_params)
      if @user.save
        token = encode_token({user_id: @user.id})
        UserMailer.account_activation(@user).deliver_now
        render json: {user: @user, token: token}
      else
        render json: {error: "Invalid username or password"}
      end
    end
    
    def login
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        if @user.activated
          token = encode_token({user_id: @user.id})
          render json: {user: @user, token: token}
        else
          render json: {error: "Account must be activated to log in"} 
        end
      else
        render json: {error: "Invalid username or password, "}
      end
    end
  
    def auto_login
      render json: @user.to_json(:include => { :cartitems => {
        :include => :item
      }})
    end
  
    private
  
    def user_params
      params.permit(:username, :password, :email, :activation, :user)
    end

end
