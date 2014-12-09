class DiamondsController < ApplicationController
  before_action :set_diamond, only: [:show, :edit, :update, :destroy]

  # GET /diamonds
  # GET /diamonds.json
  def index
    @search = Diamond.search(params[:q])
    @diamonds = @search.result.paginate(page: params[:page], per_page: 10)
  end

  # GET /diamonds/1
  # GET /diamonds/1.json
  def show
  end

  # GET /diamonds/new
  def new
    @diamond = Diamond.new
  end

  # GET /diamonds/1/edit
  def edit
  end

  # POST /diamonds
  # POST /diamonds.json
  def create
    @diamond = Diamond.new(diamond_params)

    @diamond.user_id = current_user.id

    respond_to do |format|
      if @diamond.save
        format.html { redirect_to @diamond, notice: 'Diamond was successfully created.' }
        format.json { render :show, status: :created, location: @diamond }
      else
        format.html { render :new }
        format.json { render json: @diamond.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diamonds/1
  # PATCH/PUT /diamonds/1.json
  def update
    respond_to do |format|
      if @diamond.update(diamond_params)
        format.html { redirect_to @diamond, notice: 'Diamond was successfully updated.' }
        format.json { render :show, status: :ok, location: @diamond }
      else
        format.html { render :edit }
        format.json { render json: @diamond.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diamonds/1
  # DELETE /diamonds/1.json
  def destroy
    @diamond.destroy
    respond_to do |format|
      format.html { redirect_to diamonds_url, notice: 'Diamond was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diamond
      @diamond = Diamond.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diamond_params
      params.require(:diamond).permit(:weight, :color, :clarity, :treatment, :shape, :condgirdle, :condculet, :sizeculet, :conditioncut, :length, :width, :weight, :height, :description)
    end
end
