class BooksController < ApplicationController

  def new 
    @book = Book.new    
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def create 
    @book = Book.create(book_params)
    flash[:success] = "Update Success!"
    redirect_to @book
  end

  private
    def book_params
      params.require(:book).permit(:phone, :address, :opentime, :closetime)
    end
end
