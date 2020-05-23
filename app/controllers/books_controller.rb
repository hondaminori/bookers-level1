class BooksController < ApplicationController
  def index
  	# 一覧用
  	@books = Book.all

  	# 新規登録用
  	@book = Book.new
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  	@book = Book.new(book_params)
  	@book.save
  	redirect_to books_path
  end

  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
