class StaticPagesController < ApplicationController
  
  def home
    @books = Book.all.order(book_number: :asc)
  end

  private



end
