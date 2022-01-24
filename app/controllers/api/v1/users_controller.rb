class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: users, status: 200
  end

    def create
        user = User.new(
            firstName: params[:firstName],
            lastname: params[:lastname],
            email: params[:email],
            birthday: params[:birthday],
            bio: params[:bio],
        )
        if users.save
            render json: user, status: 200
        else
            render json: { errors: "Error creating review." }, status: 422
        end
    end

  def show
    user = User.find_by(id: params[:id])
    if user
      render json: user, status: 200
    else
      render json: { errors: "user not found." }, status: 404
    end
  end

  private
    def prod_params
        params.require(:user).permit([
            :firstName,
            :lastname,
            :email,
            :birthday,
            :bio,        
            ])
    end

end
