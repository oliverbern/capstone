class ColorgemsController < ApplicationController
  
   
  before_action :set_colorgem, only: [:show, :edit, :update, :destroy]



  # GET /colorgems
  # GET /colorgems.json
  def index
      @search = Colorgem.search(params[:q])
      @colorgems = @search.result.paginate(page: params[:page], per_page: 10)
      @allcolorgems = Colorgem.all


    respond_to do |format|
      format.html
      format.csv { send_data @allcolorgems.to_csv}
      format.xls { send_data @allcolorgems.to_csv(col_sep: "\t") }
    end
  end




  def import
    Colorgem.import(params[:file], current_user)
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
    @autogemstonetype = ["Citrin", "Opal"].to_s
    #Colorgem.group(:shape).map{|item| item.shape }.to_s.html_safe
    @autoshape = ["Oval"].to_s
    @autocolor = ["Black", "Blue", "Brown", "Colorless", "Green", "Grey", "Orange", "Pink", "Red", "Violet", "White", "Yellow", "No indications", "Mixed"].to_s
    @autoclarity = ["Loupe-clean", "Eye-clean", "Few, small inclusions visible", "Few, medium inclusions visible", "Few, large inclusions visible", "Many inclusions visible", "A lot of inclusions visible", "No indications"].to_s

  end

  # GET /colorgems/1/edit
  def edit
    @autogemstonetype = ["Citrin", "Opal"].to_s
    #Colorgem.group(:shape).map{|item| item.shape }.to_s.html_safe
    @autoshape = ["Oval"].to_s
    @autocolor = ["Black", "Blue", "Brown", "Colorless", "Green", "Grey", "Orange", "Pink", "Red", "Violet", "White", "Yellow", "No indications", "Mixed"].to_s
    @autoclarity = []
  end

  # POST /colorgems
  # POST /colorgems.json
  def create
    @colorgem = Colorgem.new(colorgem_params)

    @colorgem.user_id = current_user.id

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
        format.html { redirect_to welcome_ownerlist_path, notice: 'Colorgem was successfully updated.' }
        format.json { render :show, status: :ok, location: @colorgem }
      else
        format.html { render :edit }
        format.json { render json: @colorgem.errors, status: :unprocessable_entity }
      end
    end

    @autogemstonetype = ["Citrin", "Opal"].to_s
    #Colorgem.group(:shape).map{|item| item.shape }.to_s.html_safe
    @autoshape = ["Oval"].to_s
    @autocolor = ["Black", "Blue", "Brown", "Colorless", "Green", "Grey", "Orange", "Pink", "Red", "Violet", "White", "Yellow", "No indications", "Mixed"].to_s
    @autoclarity = []
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
      params.require(:colorgem).permit(:listingstatus, :gemstonetype, :color, :shape, :length, :height, :width, :weight, :price, :secondcolor, :gemscertificate, :image, :colorbrightness, :transparency, :clarity, :treatment, :gemsunit, :showprice)
    end
end


