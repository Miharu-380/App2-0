class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
  end
  
  def index
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
  end

end
