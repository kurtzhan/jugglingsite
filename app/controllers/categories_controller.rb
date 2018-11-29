class CategoriesController < ApplicationController
  respond_to :json, :html
  before_action :set_category, only: [:show]

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  private def set_category
    @category = Category.find(params[:id])
  end
end
