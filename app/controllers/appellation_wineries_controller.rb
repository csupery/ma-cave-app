class AppellationWineriesController < ApplicationController
  before_action :set_appellation_winery, only: %i[ show edit update destroy ]

  # GET /appellation_wineries or /appellation_wineries.json
  def index
    @appellation_wineries = AppellationWinery.all
  end

  # GET /appellation_wineries/1 or /appellation_wineries/1.json
  def show
  end

  # GET /appellation_wineries/new
  def new
    @appellation_winery = AppellationWinery.new
  end

  # GET /appellation_wineries/1/edit
  def edit
  end

  # POST /appellation_wineries or /appellation_wineries.json
  def create
    @appellation_winery = AppellationWinery.new(appellation_winery_params)

    respond_to do |format|
      if @appellation_winery.save
        format.html { redirect_to @appellation_winery, notice: "Appellation winery was successfully created." }
        format.json { render :show, status: :created, location: @appellation_winery }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @appellation_winery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appellation_wineries/1 or /appellation_wineries/1.json
  def update
    respond_to do |format|
      if @appellation_winery.update(appellation_winery_params)
        format.html { redirect_to @appellation_winery, notice: "Appellation winery was successfully updated." }
        format.json { render :show, status: :ok, location: @appellation_winery }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appellation_winery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appellation_wineries/1 or /appellation_wineries/1.json
  def destroy
    @appellation_winery.destroy
    respond_to do |format|
      format.html { redirect_to appellation_wineries_url, notice: "Appellation winery was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appellation_winery
      @appellation_winery = AppellationWinery.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appellation_winery_params
      params.require(:appellation_winery).permit(:winery_id, :appellation_id)
    end
end
