class RegistrationsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Successfully created account"

            @user = User.find_by(email: params[:email])

            if @user.present?
                # Send email
                PasswordMailer.with(user: @user).reset.deliver_now
                flash.now[:alert] = "We have sent you a welcome email!."
            end   
        else
            render :new, status: :unprocessable_entity
        end     
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end