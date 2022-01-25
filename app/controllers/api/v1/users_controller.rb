class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: users, status: 200
  end

    def create
        users = User.new(
            firstName: params[:firstName],
            lastname: params[:lastname],
            email: params[:email],
            birthday: params[:birthday],
            bio: params[:bio],
        )
        if users.save
            render json: users, status: 200
        else
            render json: { errors: "Error creating review." }, status: 422
        end
    end

  def show
    users = User.find_by(id: params[:id])
    if users
      render json: users, status: 200
    else
      render json: { errors: "user not found." }, status: 404
    end
  end

  private
    def prod_params
        params.require(:users).permit([
            :firstName,
            :lastname,
            :email,
            :birthday,
            :bio,        
            ])
    end

end
