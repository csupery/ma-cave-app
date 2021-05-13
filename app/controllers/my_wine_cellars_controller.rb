class MyWineCellarsController < ApplicationController
  before_action :set_my_wine_cellar, only: %i[ show edit update destroy ]

  # GET /my_wine_cellars or /my_wine_cellars.json
  def index
    @my_wine_cellars = MyWineCellar.all
  end

  # GET /my_wine_cellars/1 or /my_wine_cellars/1.json
  def show
    @my_wines = MyWine.where(my_wine_cellar_id: params[:id])
    @appellation_wineries = AppellationWinery.all
    @my_appellation_wineries = AppellationWinery.select(AppellationWinery.arel_table[Arel.star])
                  .where(MyWine.arel_table[:my_wine_cellar_id].eq(@my_wine_cellar.id))
                  .joins(AppellationWinery.arel_table.join(Wine.arel_table)
                    .on(Wine.arel_table[:appellation_winery_id].eq(AppellationWinery.arel_table[:id])).join_sources)
                  .joins(AppellationWinery.arel_table.join(MyWine.arel_table)
                    .on(MyWine.arel_table[:wine_id].eq(Wine.arel_table[:id])).join_sources)
                  .joins(AppellationWinery.arel_table.join(Winery.arel_table)
                    .on(Winery.arel_table[:id].eq(AppellationWinery.arel_table[:winery_id])).join_sources)
                  # .group(AppellationWinery.arel_table[:id])
                  # .group(AppellationWinery.arel_table[:winery_id])
    @my_wineries = @my_appellation_wineries.group(AppellationWinery.arel_table[:id]).group(AppellationWinery.arel_table[:winery_id])
  end

  # GET /my_wine_cellars/new
  def new
    @my_wine_cellar = MyWineCellar.new
    @wine_cellars = WineCellar.all
  end

  # GET /my_wine_cellars/1/edit
  def edit
    @wine_cellar = @my_wine_cellar.wine_cellar
  end

  # POST /my_wine_cellars or /my_wine_cellars.json
  def create
    @wine_cellars = WineCellar.all
    @my_wine_cellar = current_user.my_wine_cellars.create(wine_cellar: WineCellar.all.find_by(token: params[:my_wine_cellar][:token]))

    respond_to do |format|
      if @my_wine_cellar.save
        format.html { redirect_to @my_wine_cellar, notice: "My wine cellar was successfully created." }
        format.json { render :show, status: :created, location: @my_wine_cellar }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @my_wine_cellar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_wine_cellars/1 or /my_wine_cellars/1.json
  def update
    respond_to do |format|
      if @my_wine_cellar.update(my_wine_cellar_params)
        format.html { redirect_to @my_wine_cellar, notice: "My wine cellar was successfully updated." }
        format.json { render :show, status: :ok, location: @my_wine_cellar }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @my_wine_cellar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_wine_cellars/1 or /my_wine_cellars/1.json
  def destroy
    @my_wine_cellar.destroy
    respond_to do |format|
      format.html { redirect_to my_wine_cellars_url, notice: "My wine cellar was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_wine_cellar
      @my_wine_cellar = MyWineCellar.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def my_wine_cellar_params
      params.require(:my_wine_cellar).permit(:user_id, :wine_cellar_id)
    end
end
