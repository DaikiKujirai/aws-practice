class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end


  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.save
      redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
      flash[:update] = "Book was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
    flash[:destroy] = "Book was successfully destroyed."

  end

  private
  def book_params
    params.require(:book).permit(:user, :title, :body)
    # ストロングパラメータがわからない
  end

end