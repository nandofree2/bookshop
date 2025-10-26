class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_admin!, except: [:index, :show]
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.includes(:category).order(created_at: :desc)
  end

  def show
    @book = Book.find(params[:id])
    @comments = @book.comments.includes(:user)
    @comment = Comment.new
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: "Book successfully created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: "Book updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: "Book deleted successfully!"
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:name, :category_id, :price, :rating, :flag, :cover_image)
  end

  def require_admin!
    redirect_to root_path, alert: "Access denied!" unless current_user&.role.name == 'admin'
  end
end
