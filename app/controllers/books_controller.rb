class BooksController < ApplicationController
  before_action :set_book, only: [:show]

  def index
    @books = Book.all.order(book_number: :asc)
  end

  def show
    @chapters = @book.chapters.all
  end


  private

  def set_book
    @book = Book.find(params[:id])
  end

end
