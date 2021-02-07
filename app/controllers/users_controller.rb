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

  private

  def book_params
    params.require(:book).permit(:user_id, :title, :body)
  end
end
