class BooksController < ApplicationController

  def top
  end

  def index
    @books = Book.all
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    if 
     @book.save
     redirect_to book_path(@book.id)
    else
     @books = Book.all
     render "index"
    end
  end

  def edit
    @book = Book.find_by(id:params[:id])
  end

  def update
    @book = Book.find_by(id:params[:id])
    @book.update(book_params)
    if 
     @book.save
     redirect_to book_path(@book.id)
    else
     @books = Book.all
     render "edit"
    end
  end

  def show
    @book = Book.find_by(id:params[:id])
  end

  def delete
    @book = Book.find_by(id:params[:id])
    @book.destroy
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end