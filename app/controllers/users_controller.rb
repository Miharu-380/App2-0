class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = 'You have created book successfully.'
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render "index"
    end
  end
  
  def index
    @users = User.all
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if current_user.update_without_password(user_params)
      flash[:notice] = 'You have updated user successfully.'
      redirect_to user_path(@user.id)
    else
      redirect_to user_path(@user.id)
    end
  end


private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
