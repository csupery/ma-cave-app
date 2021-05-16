class WineriesController < ApplicationController
  before_action :set_winery, only: %i[ show edit update destroy ]

  # GET /wineries or /wineries.json
  def index
    if params[:my_wine_cellar_id].present?
      @my_wine_cellar = MyWineCellar.find(params[:my_wine_cellar_id])
      @wineries = Winery.select(Winery.arel_table[Arel.star]).where(
                  MyWine.arel_table[:my_wine_cellar_id].eq(@my_wine_cellar.id)
                ).joins(
                  Winery.arel_table.join(AppellationWinery.arel_table).on(
                    Winery.arel_table[:id].eq(AppellationWinery.arel_table[:winery_id])
                  ).join_sources
                ).joins(
                  Winery.arel_table.join(Wine.arel_table).on(
                    AppellationWinery.arel_table[:id].eq(Wine.arel_table[:appellation_winery_id])
                  ).join_sources
                ).joins(
                  Winery.arel_table.join(MyWine.arel_table).on(
                    Wine.arel_table[:id].eq(MyWine.arel_table[:wine_id])
                  ).join_sources
                ).group(Winery.arel_table[:id])
    else
      @wineries = Winery.all
    end
  end

  # GET /wineries/1 or /wineries/1.json
  def show
  end

  # GET /wineries/new
  def new
    @winery = Winery.new
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
      params.require(:winery).permit(:name)
    end
end
