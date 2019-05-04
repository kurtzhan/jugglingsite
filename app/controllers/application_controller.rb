class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
    @articles = Article.includes(:tags).is_home_page.order("ordinal")
  end
end
