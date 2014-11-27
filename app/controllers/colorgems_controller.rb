class ColorgemsController < ApplicationController
  before_action :set_colorgem, only: [:show, :edit, :update, :destroy]

  # GET /colorgems
  # GET /colorgems.json
  def index
    @search = Colorgem.search(params[:q])
    @colorgems = @search.result.paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.csv { send_data @colorgems.to_csv}
      format.xls { send_data @colorgems.to_csv(col_sep: "\t") }
    end
  end

  def import
    Colorgem.import(params[:file])
    redirect_to colorgems_path, notice: "Products imported."
  end

  def accessible_attributes
 [gemstonetype, color, shape, length, height, width, weight, gemscertificate]
  end

  # GET /colorgems/1
  # GET /colorgems/1.json
  def show
  end

  # GET /colorgems/new
  def new
    @colorgem = Colorgem.new
  end

  # GET /colorgems/1/edit
  def edit
  end

  # POST /colorgems
  # POST /colorgems.json
  def create
    @colorgem = Colorgem.new(colorgem_params)

    @colorgem.owner = current_user.id

    respond_to do |format|
      if @colorgem.save
        format.html { redirect_to @colorgem, notice: 'Colorgem was successfully created.' }
        format.json { render :show, status: :created, location: @colorgem }
      else
        format.html { render :new }
        format.json { render json: @colorgem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /colorgems/1
  # PATCH/PUT /colorgems/1.json
  def update
    respond_to do |format|
      if @colorgem.update(colorgem_params)
        format.html { redirect_to @colorgem, notice: 'Colorgem was successfully updated.' }
        format.json { render :show, status: :ok, location: @colorgem }
      else
        format.html { render :edit }
        format.json { render json: @colorgem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colorgems/1
  # DELETE /colorgems/1.json
  def destroy
    @colorgem.destroy
    respond_to do |format|
      format.html { redirect_to colorgems_url, notice: 'Colorgem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_colorgem
      @colorgem = Colorgem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def colorgem_params
      params.require(:colorgem).permit(:gemstonetype, :color, :shape, :length, :height, :width, :weight, :gemscertificate)
    end
end
