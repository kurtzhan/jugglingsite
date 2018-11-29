class ArticlesController < ApplicationController
  respond_to :json, :html
  before_action :set_article, only: [:show]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  private def set_article
    @article = Article.includes(:categories).find(params[:id])
  end
end
