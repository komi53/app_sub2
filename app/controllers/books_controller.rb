class BooksController < ApplicationController
before_action :authenticate_user!

  def show
  	@book = Book.find(params[:id])
    @user = User.find(@book.user_id)
    @book_new = Book.new
  end

  def index
  	@books = Book.all #一覧表示するためにBookモデルの情報を全てくださいのall
    @book_new = Book.new
  end

  def create
        book = Book.new(book_params)
        book.user_id = current_user.id
        if book.save
            flash[:succes] = 'Book was successfully created.'
            redirect_to book_path(book.id)
        else
            @books = Book.all
            @book_new = book
            render 'index'
        end
    end

    def edit
        @book = Book.find(params[:id])
        if @book.user.id == current_user.id
        else
            redirect_to books_path
        end
    end

    def update
        book = Book.find(params[:id])
        if book.update(book_params)
            flash[:succes] = 'Book was successfully updated.'
            redirect_to book_path(book.id)
        else
            @book = book
            render :edit
        end
      end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destoy
  	redirect_to books_path
    flash[:succes] = "successfully delete book!"
  end

  private

  def book_params
  	params.require(:book).permit(:title, :body, :user_id)
      end

end
