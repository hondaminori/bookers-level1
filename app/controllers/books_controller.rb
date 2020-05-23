class BooksController < ApplicationController
  def index
  	# 一覧用
  	@books = Book.all

  	# 新規登録用
  	@book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end

  def new
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])

  	if @book.update(book_params)
		flash[:success] = "Book was successfully updated."
	  	redirect_to @book
	else
		render :edit
	end
  end

  def create
  	@book = Book.new(book_params)
  	@books = Book.all

  	if @book.save
		flash[:success] = "Book was successfully created."
	  	redirect_to @book
	else
		render :index
	end

  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
	flash[:success] = "Book was successfully destroyed."
  	redirect_to books_path
  end

  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
