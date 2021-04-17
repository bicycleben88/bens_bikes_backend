class AccountActivationsController < ApplicationController

    def edit
        @user = User.find_by(email: params[:email])
        if @user && !@user.activated? && @user.decode_activation_digest(params[:id], @user.activation_digest)
            @user.update_attribute(:activated, true)
            redirect_to "https://bens-bikes-frontend.vercel.app/login"
        else
            render json: {error: "Cannot activate user"}
        end
    end
    
end
