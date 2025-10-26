class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:create, :destroy]
  before_action :set_comment, only: [:destroy]

  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @book, notice: "Comment added successfully!"
    else
      redirect_to @book, alert: "Failed to add comment."
    end
  end

   def destroy
    if current_user == @comment.user || current_user.role.name.in?(%w[admin staff])
      @comment.destroy
      redirect_to @book, notice: "Comment deleted successfully!"
    else
      redirect_to @book, alert: "You are not allowed to delete this comment."
    end
  end

  private
  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_comment
    @comment = @book.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
