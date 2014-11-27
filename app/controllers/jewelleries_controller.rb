class JewelleriesController < ApplicationController
  before_action :set_jewellery, only: [:show, :edit, :update, :destroy]

  # GET /jewelleries
  # GET /jewelleries.json
  def index
    @jewelleries = Jewellery.all
  end

  # GET /jewelleries/1
  # GET /jewelleries/1.json
  def show
  end

  # GET /jewelleries/new
  def new
    @jewellery = Jewellery.new
  end

  # GET /jewelleries/1/edit
  def edit
  end

  # POST /jewelleries
  # POST /jewelleries.json
  def create
    @jewellery = Jewellery.new(jewellery_params)

    respond_to do |format|
      if @jewellery.save
        format.html { redirect_to @jewellery, notice: 'Jewellery was successfully created.' }
        format.json { render :show, status: :created, location: @jewellery }
      else
        format.html { render :new }
        format.json { render json: @jewellery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jewelleries/1
  # PATCH/PUT /jewelleries/1.json
  def update
    respond_to do |format|
      if @jewellery.update(jewellery_params)
        format.html { redirect_to @jewellery, notice: 'Jewellery was successfully updated.' }
        format.json { render :show, status: :ok, location: @jewellery }
      else
        format.html { render :edit }
        format.json { render json: @jewellery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jewelleries/1
  # DELETE /jewelleries/1.json
  def destroy
    @jewellery.destroy
    respond_to do |format|
      format.html { redirect_to jewelleries_url, notice: 'Jewellery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jewellery
      @jewellery = Jewellery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jewellery_params
      params.require(:jewellery).permit(:title, :stone1, :stone2, :stone3, :material1, :material2, :material3, :description, :certificate, :companymade, :owner)
    end
end
