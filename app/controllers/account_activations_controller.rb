class AccountActivationsController < ApplicationController

    def edit
        @user = User.find_by(email: params[:email])
        if @user && !@user.activated?
            @user.update_attribute(:activated, true)
            render json: {user: @user}
        else
            render json: {error: "Cannot activate user"}
        end
    end
    
end
