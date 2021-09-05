class WineriesController < ApplicationController
  before_action :set_winery, only: %i[ show edit update destroy ]

  # GET /wineries or /wineries.json
  def index
    @my_wine_cellar = MyWineCellar.find(params[:my_wine_cellar_id])
    @wineries = Winery.all
    @my_winery = MyWinery.new
  end

  # GET /wineries/1 or /wineries/1.json
  def show
    if params[:my_wine_cellar_id].present?

      @my_wine_cellar = MyWineCellar.find(params[:my_wine_cellar_id])
      @my_wines = MyWine.where(my_wine_cellar_id: params[:id])
      @stocks = Stock.where(my_wine_cellar: params[:my_wine_cellar_id])
      @sizes = (@stocks.map do |stock| stock.size end).uniq.sort_by &SIZE.method(:index)
      @vintages = (@stocks.map do |stock| stock.vintage end).uniq.sort
    end
  end

  # GET /wineries/new
  def new
    @winery = Winery.new
    @appellation = @winery.appellations.build
    @appellation_winery = AppellationWinery.create(winery_id: @winery.id, appellation_id: @appellation.id)
  end

  # GET /wineries/1/edit
  def edit
  end

  # POST /wineries or /wineries.json
  def create
    @winery = Winery.new(winery_params)

    respond_to do |format|
      if @winery.save
        format.html { redirect_to @winery, notice: "Winery was successfully created." }
        format.json { render :show, status: :created, location: @winery }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @winery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wineries/1 or /wineries/1.json
  def update
    respond_to do |format|
      if @winery.update(winery_params)
        format.html { redirect_to @winery, notice: "Winery was successfully updated." }
        format.json { render :show, status: :ok, location: @winery }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @winery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wineries/1 or /wineries/1.json
  def destroy
    @winery.destroy
    respond_to do |format|
      format.html { redirect_to wineries_url, notice: "Winery was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_winery
      @winery = Winery.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def winery_params
      params.require(:winery).permit(:name, appellations_attributes: [:name, :location], appellation_ids: [])
    end
end
