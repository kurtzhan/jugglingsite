module Admin
  class CategoriesController < Admin::ApplicationController
    respond_to :json, :html
    before_action :set_category, only: [:show, :edit, :update, :destroy]

    # GET /categories
    # GET /categories.json
    def index
      @categories = Category.all
    end

    # GET /categories/1
    # GET /categories/1.json
    def show
    end

    # GET /categories/new
    def new
      @category = Category.new
      @url = admin_categories_path
    end

    # GET /categories/1/edit
    def edit
      @url = admin_category_path(@category)
    end

    # POST /categories
    # POST /categories.json
    def create
      @category = Category.new(category_params)

      if @category.save
        flash[:notice] = t('admin.categories.create.success')
        respond_with :edit, :admin, @category
      else
        flash[:warning] = @category.errors.full_messages.uniq.join(', ')
        respond_with :new, :admin, :category
      end
    end

    # PATCH/PUT /categories/1
    # PATCH/PUT /categories/1.json
    def update
      if @category.update(juggler_params)
        flash[:notice] = t('admin.categories.update.success')
        respond_with :edit, :admin, @category
      else
        flash[:warning] = @category.errors.full_messages.uniq.join(', ')
        respond_with :edit, :admin, :category
      end
    end

    # DELETE /categories/1
    # DELETE /categories/1.json
    def destroy
      @category.destroy
      respond_to do |format|
        format.html { redirect_to admin_categories_path, notice: t('admin.categories.destroy.success') }
        format.json { head :no_content }
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    private def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    private def category_params
      params.require(:category).permit(:name)
    end
  end
end
