class MyWinesController < ApplicationController
  before_action :set_my_wine, only: %i[ show edit update destroy ]

  # GET /my_wines or /my_wines.json
  def index
    @my_wines = MyWine.all
  end

  # GET /my_wines/1 or /my_wines/1.json
  def show
  end

  # GET /my_wines/new
  def new
    @my_wine = MyWine.new
  end

  # GET /my_wines/1/edit
  def edit
  end

  # POST /my_wines or /my_wines.json
  def create
    @my_wine = MyWine.new(my_wine_params)

    respond_to do |format|
      if @my_wine.save
        format.html { redirect_to @my_wine, notice: "My wine was successfully created." }
        format.json { render :show, status: :created, location: @my_wine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @my_wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_wines/1 or /my_wines/1.json
  def update
    respond_to do |format|
      if @my_wine.update(my_wine_params)
        format.html { redirect_to @my_wine, notice: "My wine was successfully updated." }
        format.json { render :show, status: :ok, location: @my_wine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @my_wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_wines/1 or /my_wines/1.json
  def destroy
    @my_wine.destroy
    respond_to do |format|
      format.html { redirect_to my_wines_url, notice: "My wine was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_wine
      @my_wine = MyWine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def my_wine_params
      params.require(:my_wine).permit(:wine_id, :wine_cellar_id, :description)
    end
end
