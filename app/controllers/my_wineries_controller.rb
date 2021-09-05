class MyWineriesController < ApplicationController
  before_action :set_my_winery, only: %i[ show edit update destroy ]

  # GET /my_wineries or /my_wineries.json
  def index
    @my_wineries = MyWinery.all
  end

  # GET /my_wineries/1 or /my_wineries/1.json
  def show
  end

  # GET /my_wineries/new
  def new
    @my_winery = MyWinery.new
  end

  # GET /my_wineries/1/edit
  def edit
  end

  # POST /my_wineries or /my_wineries.json
  def create
    @my_wine_cellar = MyWineCellar.find(params[:my_wine_cellar_id])
    @my_winery = MyWinery.new(my_winery_params)

    respond_to do |format|
      if @my_winery.save
        format.html { redirect_to @my_wine_cellar, notice: "My winery was successfully created." }
        format.json { render :show, status: :created, location: @my_wine_cellar }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @my_wine_cellar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_wineries/1 or /my_wineries/1.json
  def update
    respond_to do |format|
      if @my_winery.update(my_winery_params)
        format.html { redirect_to @my_winery, notice: "My winery was successfully updated." }
        format.json { render :show, status: :ok, location: @my_winery }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @my_winery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_wineries/1 or /my_wineries/1.json
  def destroy
    @my_winery.destroy
    respond_to do |format|
      format.html { redirect_to my_wineries_url, notice: "My winery was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_winery
      @my_winery = MyWinery.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def my_winery_params
      params.require(:my_winery).permit(:my_wine_cellar_id, :winery_id)
    end
end
