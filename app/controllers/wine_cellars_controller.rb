class WineCellarsController < ApplicationController
  before_action :set_wine_cellar, only: %i[ show edit update destroy ]

  # GET /wine_cellars or /wine_cellars.json
  def index
    @wine_cellars = WineCellar.all
  end

  # GET /wine_cellars/1 or /wine_cellars/1.json
  def show
  end

  # GET /wine_cellars/new
  def new
    @wine_cellar = WineCellar.new
  end

  # GET /wine_cellars/1/edit
  def edit
  end

  # POST /wine_cellars or /wine_cellars.json
  def create
    @wine_cellar = WineCellar.new(wine_cellar_params)
    @my_wine_cellar = MyWineCellar.create(user: current_user, wine_cellar: @wine_cellar)

    respond_to do |format|
      if @wine_cellar.save && @my_wine_cellar
        format.html { redirect_to my_wine_cellars_url, notice: "Wine cellar was successfully created." }
        format.json { render :show, status: :created, location: @wine_cellar }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wine_cellar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wine_cellars/1 or /wine_cellars/1.json
  def update
    respond_to do |format|
      if @wine_cellar.update(wine_cellar_params)
        format.html { redirect_to @wine_cellar, notice: "Wine cellar was successfully updated." }
        format.json { render :show, status: :ok, location: @wine_cellar }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wine_cellar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wine_cellars/1 or /wine_cellars/1.json
  def destroy
    @wine_cellar.destroy
    respond_to do |format|
      format.html { redirect_to wine_cellars_url, notice: "Wine cellar was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wine_cellar
      @wine_cellar = WineCellar.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wine_cellar_params
      params.require(:wine_cellar).permit(:name, :token)
    end
end
