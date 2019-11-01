class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'novel'

  def home
    @books = Book.all
  end
end
