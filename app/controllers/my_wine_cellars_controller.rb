class MyWineCellarsController < ApplicationController
  before_action :set_my_wine_cellar, only: %i[ show edit update destroy ]

  # GET /my_wine_cellars or /my_wine_cellars.json
  def index
    @my_wine_cellars = MyWineCellar.all
  end

  # GET /my_wine_cellars/1 or /my_wine_cellars/1.json
  def show
  end

  # GET /my_wine_cellars/new
  def new
    @my_wine_cellar = MyWineCellar.new
    @wine_cellars = WineCellar.all

  end

  # GET /my_wine_cellars/1/edit
  def edit
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
