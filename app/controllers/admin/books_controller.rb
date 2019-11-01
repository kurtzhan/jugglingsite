module Admin
  class BooksController < Admin::ApplicationController
    respond_to :json, :html
    before_action :set_book, only: [:show, :edit, :update, :destroy]

    # GET /books
    # GET /books.json
    def index
      @books = Book.all
    end

    # GET /books/1
    # GET /books/1.json
    def show
    end

    # GET /books/new
    def new
      @book = Book.new
      @url = admin_books_path
    end

    # GET /books/1/edit
    def edit
      @url = admin_book_path(@book)
    end

    # POST /books
    # POST /books.json
    def create
      @book = Book.new(book_params)

      if @book.save
        flash[:notice] = t('admin.books.create.success')
        respond_with :edit, :admin, @book
      else
        flash[:warning] = @book.errors.full_messages.uniq.join(', ')
        respond_with :new, :admin, :book
      end
    end

    # PATCH/PUT /books/1
    # PATCH/PUT /books/1.json
    def update
      if @book.update(book_params)
        flash[:notice] = t('admin.books.update.success')
        respond_with :edit, :admin, @book
      else
        flash[:warning] = @book.errors.full_messages.uniq.join(', ')
        respond_with :edit, :admin, :book
      end
    end

    # DELETE /books/1
    # DELETE /books/1.json
    def destroy
      @book.destroy
      respond_to do |format|
        format.html { redirect_to admin_books_path, notice: t('admin.books.destroy.success') }
        format.json { head :no_content }
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    private def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    private def book_params
      params.require(:book).permit(:name)
    end
  end
end