class ArticlesController < ApplicationController
  respond_to :json, :html
  before_action :set_article, only: [:show]

  # GET /articles
  # GET /articles.json
  def index
    @articles = params[:tag].nil? ? Article.includes(:tags).all : Article.includes(:tags).tagged_with(params[:tag])
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  private def set_article
    @article = Article.includes(:tags).find(params[:id])
  end
end
