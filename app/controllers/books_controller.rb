class BooksController < ApplicationController
  def index
    @books = Book.all # instance variables are prefixed with an @. If we said books = Book.all, we wouldn't be able to access books in the template
  end
end
