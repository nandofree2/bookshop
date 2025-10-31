class WishlistsController < ApplicationController
  before_action :authenticate_user!

  def index
    # @wishlists = Wishlist.where(id: current_user.id)
    @books = Book.where(id: current_user.wishlists.pluck(:book_id))
  end


  def create
    @wishlist = Wishlist.find_or_initialize_by(book_id: params[:wishlist][:book_id], user_id: params[:wishlist][:user_id])

    if @wishlist.persisted?
      redirect_to book_path(@wishlist.book_id), alert: "#{@wishlist.book.name}  is already in your wishlist."
    elsif @wishlist.save
      redirect_to book_path(@wishlist.book_id), notice: "#{@wishlist.book.name} added to wishlist successfully!"
    else
      redirect_to book_path(@wishlist.book_id), alert: "Failed to add to wishlist."
    end
  end

  def destroy
    Wishlist.find_by(id: params[:id]).destroy!
    respond_to do |format|
      format.html { redirect_to book_path, notice: "Wishlist was successfully Remove.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    def wishlist_params
      params.require(:wishlist).permit(:book_id, :user_id)
    end
end
