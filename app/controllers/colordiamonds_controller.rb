class ColordiamondsController < ApplicationController
  before_action :set_colordiamond, only: [:show, :edit, :update, :destroy]

  # GET /colordiamonds
  # GET /colordiamonds.json
  def index
    @colordiamonds = Colordiamond.all
  end

  # GET /colordiamonds/1
  # GET /colordiamonds/1.json
  def show
  end

  # GET /colordiamonds/new
  def new
    @colordiamond = Colordiamond.new
  end

  # GET /colordiamonds/1/edit
  def edit
  end

  # POST /colordiamonds
  # POST /colordiamonds.json
  def create
    @colordiamond = Colordiamond.new(colordiamond_params)

    respond_to do |format|
      if @colordiamond.save
        format.html { redirect_to @colordiamond, notice: 'Colordiamond was successfully created.' }
        format.json { render :show, status: :created, location: @colordiamond }
      else
        format.html { render :new }
        format.json { render json: @colordiamond.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /colordiamonds/1
  # PATCH/PUT /colordiamonds/1.json
  def update
    respond_to do |format|
      if @colordiamond.update(colordiamond_params)
        format.html { redirect_to @colordiamond, notice: 'Colordiamond was successfully updated.' }
        format.json { render :show, status: :ok, location: @colordiamond }
      else
        format.html { render :edit }
        format.json { render json: @colordiamond.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colordiamonds/1
  # DELETE /colordiamonds/1.json
  def destroy
    @colordiamond.destroy
    respond_to do |format|
      format.html { redirect_to colordiamonds_url, notice: 'Colordiamond was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_colordiamond
      @colordiamond = Colordiamond.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def colordiamond_params
      params.require(:colordiamond).permit(:weight, :color, :clarity, :treatment, :shape, :condgirdle, :condculet, :sizeculet, :conditioncut, :length, :width, :weight, :height, :description, :intensitecolor, :bycolor1, :bycolor2, :diamondcertificate)
    end
end
