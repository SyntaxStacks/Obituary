class ObituariesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_obituary, only: [:show, :edit, :update, :destroy]
  before_action :redirect_bad_user, only: [:edit, :destroy, :update]
  # GET /obituaries
  # GET /obituaries.json
  def index
    @obituaries = Obituary.all.order('created_at DESC')

    if params[:search]
      @obituaries = Obituary.search(params[:search]).order("created_at DESC")
    end
  end

  # GET /obituaries/1
  # GET /obituaries/1.json
  def show
  end

  # GET /obituaries/new
  def new
    @obituary = Obituary.new
    @obituary.obituary_images.build
  end

  # GET /obituaries/1/edit
  def edit
  end

  # POST /obituaries
  # POST /obituaries.json
  def create
    @obituary = Obituary.new(obituary_params)
    @obituary.user_id = current_user.id

    respond_to do |format|
      if @obituary.save
        format.html { redirect_to @obituary, notice: 'Obituary was successfully created.' }
        format.json { render :show, status: :created, location: @obituary }
      else
        format.html { render :new }
        format.json { render json: @obituary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /obituaries/1
  # PATCH/PUT /obituaries/1.json
  def update
    respond_to do |format|
      if @obituary.update(obituary_params)
        format.html { redirect_to @obituary, notice: 'Obituary was successfully updated.' }
        format.json { render :show, status: :ok, location: @obituary }
      else
        format.html { render :edit }
        format.json { render json: @obituary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /obituaries/1
  # DELETE /obituaries/1.json
  def destroy
    @obituary.destroy
    respond_to do |format|
      format.html { redirect_to obituaries_url, notice: 'Obituary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_obituary
      @obituary = Obituary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def obituary_params
      params.require(:obituary).permit(:name, :birth_date, :death_date, :content, obituary_images_attributes: [ :_destroy, :id, :image] )
    end

    def redirect_bad_user
      unless @obituary.user_id == current_user.id
        redirect_to :root
      end
    end
end
