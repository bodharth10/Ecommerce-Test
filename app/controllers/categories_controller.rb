class CategoriesController < ApplicationController
  before_action :set_categories, only: [:show, :edit, :update, :destroy]

  skip_before_action :authenticate_user!, only: :show

  def index
    @category = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
      flash[:success] = 'Category was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to categories_path, notice: 'Category was successfully updated.' }
        format.js 
      else
        format.html { render :edit }
        format.js 
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to category_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def show
  end

  private

  def set_categories
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end