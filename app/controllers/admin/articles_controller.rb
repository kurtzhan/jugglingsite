module Admin
  class ArticlesController < Admin::ApplicationController
    respond_to :json, :html
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    # GET /articles
    # GET /articles.json
    def index
      @articles = Article.all
    end

    # GET /articles/1
    # GET /articles/1.json
    def show
    end

    # GET /articles/new
    def new
      @article = Article.new
      @url = admin_articles_path
    end

    # GET /articles/1/edit
    def edit
      @url = admin_article_path(@article)
    end

    # POST /articles
    # POST /articles.json
    def create
      @article = Article.new(article_params)

      if @article.save
        flash[:notice] = t('admin.articles.create.success')
        respond_with :edit, :admin, @article
      else
        flash[:warning] = @article.errors.full_messages.uniq.join(', ')
        respond_with :new, :admin, :article
      end
    end

    # PATCH/PUT /articles/1
    # PATCH/PUT /articles/1.json
    def update
      if @article.update(article_params)
        flash[:notice] = t('admin.articles.update.success')
        respond_with :edit, :admin, @article
      else
        flash[:warning] = @article.errors.full_messages.uniq.join(', ')
        respond_with :edit, :admin, :article
      end
    end

    # DELETE /articles/1
    # DELETE /articles/1.json
    def destroy
      @article.destroy
      respond_to do |format|
        format.html { redirect_to admin_articles_path, notice: t('admin.articles.destroy.success') }
        format.json { head :no_content }
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    private def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    private def article_params
      params.require(:article).permit(:title, :is_home_page, :ordinal, :description, :body, :category_ids => [])
    end
  end
end
