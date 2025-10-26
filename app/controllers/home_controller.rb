class HomeController < ApplicationController
  def index
    @books = Book.includes(:category).order(created_at: :desc)
  end
end
