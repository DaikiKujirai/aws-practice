class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books =  @user.books
    @book = Book.new
  end

  def create
    @book = new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def edit
    @user = User.find(params[:id])
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
