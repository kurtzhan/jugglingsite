module Admin
  class JugglersController < Admin::ApplicationController
    respond_to :json, :html
    before_action :set_juggler, only: [:show, :edit, :update, :destroy]

    # GET /jugglers
    # GET /jugglers.json
    def index
      @jugglers = Juggler.all
    end

    # GET /jugglers/1
    # GET /jugglers/1.json
    def show
    end

    # GET /jugglers/new
    def new
      @juggler = Juggler.new
      @url = admin_jugglers_path
    end

    # GET /jugglers/1/edit
    def edit
      @url = admin_juggler_path(@juggler)
    end

    # POST /jugglers
    # POST /jugglers.json
    def create
      @juggler = Juggler.new(juggler_params)

      if @juggler.save
        flash[:notice] = t('admin.jugglers.create.success')
        respond_with :edit, :admin, @juggler
      else
        flash[:warning] = @juggler.errors.full_messages.uniq.join(', ')
        respond_with :new, :admin, :juggler
      end
    end

    # PATCH/PUT /jugglers/1
    # PATCH/PUT /jugglers/1.json
    def update
      if @juggler.update(juggler_params)
        flash[:notice] = t('admin.jugglers.update.success')
        respond_with :edit, :admin, @juggler
      else
        flash[:warning] = @juggler.errors.full_messages.uniq.join(', ')
        respond_with :edit, :admin, :juggler
      end
    end

    # DELETE /jugglers/1
    # DELETE /jugglers/1.json
    def destroy
      @juggler.destroy
      respond_to do |format|
        format.html { redirect_to admin_jugglers_path, notice: t('admin.jugglers.destroy.success') }
        format.json { head :no_content }
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    private def set_juggler
      @juggler = Juggler.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    private def juggler_params
      params.require(:juggler).permit(:name, :description, :avatar, :tag_list, :displayable)
    end
  end
end
