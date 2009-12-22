class BooksController < ApplicationController
  def index
    @books = Book.paginate :page => params[:page], :per_page => 10
  end

  def show
    @book = Book.find(params[:id])
    @comments = @book.comments.paginate :page => params[:page], :per_page => 10, :order => 'created_at ASC'
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new params[:book]
    if @book.save
      flash[:notice] = "#{@book.title} saved."
      redirect_to @book
    else
      render :new
    end
  end
end
