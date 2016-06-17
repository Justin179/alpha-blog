class BooksController < ApplicationController

  def new 
    if session[:user_id].nil?
      flash[:danger] = "Please Log in or sign up first!"
      redirect_to login_path
    else
      @user = User.find_by(id: session[:user_id])
      if @user.books.empty?
        @book = @user.books.build       
      else
        @book = Book.find_by(id: @user.books.to_ary[0].id)
      end
      
    end
    
  end
  
  def create
    if session[:user_id].nil?
      flash[:danger] = "Please Log in or sign up first!"
      redirect_to login_path
    else
      @user = User.find_by(id: session[:user_id])
      if @user.books.empty?
        @user.books.create(book_params)
        flash[:success] = "Update Success!"
        redirect_to @user
      else
        @book = Book.find_by(id: @user.books.to_ary[0].id)
        @book.update_attributes(book_params)
        flash[:success] = "Update Success!"
        
      end
      
    end
  end

  def update
    if session[:user_id].nil?
      flash[:danger] = "Please Log in or sign up first!"
      redirect_to login_path
    else
      @user = User.find_by(id: session[:user_id])
      if @user.books.empty?
        @user.books.create(book_params)
        flash[:success] = "Update Success!"
        redirect_to @user
      else
        @book = Book.find_by(id: @user.books.to_ary[0].id)
        @book.update_attributes(book_params)
        flash[:success] = "Update Success!"
        redirect_to @user
      end
    end
    
  end

  private
    def book_params
      params.require(:book).permit(:phone, :address, :opentime, :closetime)
    end
end
