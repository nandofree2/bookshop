class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    @book = Book.find(params[:id])
    @book.inspect
    @comments = @book.comments.includes(:user)
    @comment = Comment.new
  end
end
