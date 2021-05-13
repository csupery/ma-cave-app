class WinesController < ApplicationController
  before_action :set_wine, only: %i[ show edit update destroy ]

  # GET /wines or /wines.json
  def index
    @wines = Wine.all
    @my_wine_cellar = MyWineCellar.find(params[:my_wine_cellar_id])
  end

  # GET /wines/1 or /wines/1.json
  def show
    @my_wine_cellar = MyWineCellar.find(params[:my_wine_cellar_id])
  end

  # GET /wines/new
  def new
    @wine = Wine.new
    @my_wine_cellars = MyWineCellar.all
  end

  # GET /wines/1/edit
  def edit
    @my_wine_cellars = MyWineCellar.all
    @my_wine_cellar = MyWineCellar.find(params[:my_wine_cellar_id])

  end

  # POST /wines or /wines.json
  def create
    @wine = Wine.new(wine_params)
    @my_wine_cellar = MyWineCellar.find(params[:my_wine_cellar_id])
    @my_wine = MyWine.create!(wine: @wine, my_wine_cellar: @my_wine_cellar)

    respond_to do |format|
      if @wine.save && @my_wine.save
        format.html { redirect_to my_wine_cellar_wines_url, notice: "Wine was successfully created." }
        format.json { render :show, status: :created, location: @wine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wines/1 or /wines/1.json
  def update
    @my_wine_cellar = MyWineCellar.find(params[:my_wine_cellar_id])

    respond_to do |format|
      if @wine.update(wine_params)
        format.html { redirect_to my_wine_cellar_wines_url, notice: "Wine was successfully updated." }
        format.json { render :show, status: :ok, location: @wine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wines/1 or /wines/1.json
  def destroy
    @wine.destroy
    respond_to do |format|
      format.html { redirect_to my_wine_cellar_wines_url, notice: "Wine was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wine
      @wine = Wine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wine_params
      params.require(:wine).permit(:wine_type, :appellation_winery_id, :name)
    end
end
