class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_admin!, except: [:index, :show]
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  
  def index
    @categories = Category.all.order(created_at: :desc)
  end

  def show

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: "category successfully created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: "category updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: "category deleted successfully!"
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin!
    redirect_to root_path, alert: "Access denied!" unless current_user&.role.name == 'admin'
  end
end
