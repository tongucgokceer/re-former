class UsersController < ApplicationController
    include UsersHelper

    def index
        @users=User.all
    end
    def new
        @user=User.new
    end

    def create
        @user=User.new(user_params)

        if @user.save
            flash.notice= "User successfully created !!!"
            redirect_to new_user_path
        else
            render :new
        end
    end

    def edit
        @user=User.find(params[:id])
    end

    def update
        @user=User.find(params[:id])



        if @user.update(user_params)
          flash.notice= "User '#{@user.username}' Updated !"
          redirect_to users_path
        else
            puts "valid?: #{@user.valid?}"
            puts "errors: #{@user.errors.full_messages}"
          render :edit
        end
    end

    def show
        @user=User.find(params[:id])
    end
end
