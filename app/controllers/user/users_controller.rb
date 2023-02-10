class User::UsersController < ApplicationController
  def show
  end

  def edit
  end

  def update
  end

  def index
  end

  def unsubscribe
  end

  def withdrawal
  end
  
  def destroy_confirm
    @user = current_user
  end

  def destroy_user
    @user = current_user
    if @user.email == 'guestda@example.com'
      reset_session
      redirect_to :root
    else
      @user.update(is_valid: false)
      reset_session
      redirect_to :root
    end
  end
  
end
