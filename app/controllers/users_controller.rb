class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @books =  Book.all
    @book = Book.new
  end

  def create
    @book = new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.user_id)
  end

  def edit
    @user = User.find(params[:id])
    if  @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def index
    @users = User.all

  end

  def update
    @user = User.find(params[:id])

    redirect_to user_path
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to books_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end
