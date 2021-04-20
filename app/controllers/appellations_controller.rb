class AppellationsController < ApplicationController
  before_action :set_appellation, only: %i[ show edit update destroy ]

  # GET /appellations or /appellations.json
  def index
    @appellations = Appellation.all
  end

  # GET /appellations/1 or /appellations/1.json
  def show
  end

  # GET /appellations/new
  def new
    @appellation = Appellation.new
  end

  # GET /appellations/1/edit
  def edit
  end

  # POST /appellations or /appellations.json
  def create
    @appellation = Appellation.new(appellation_params)

    respond_to do |format|
      if @appellation.save
        format.html { redirect_to @appellation, notice: "Appellation was successfully created." }
        format.json { render :show, status: :created, location: @appellation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @appellation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appellations/1 or /appellations/1.json
  def update
    respond_to do |format|
      if @appellation.update(appellation_params)
        format.html { redirect_to @appellation, notice: "Appellation was successfully updated." }
        format.json { render :show, status: :ok, location: @appellation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appellation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appellations/1 or /appellations/1.json
  def destroy
    @appellation.destroy
    respond_to do |format|
      format.html { redirect_to appellations_url, notice: "Appellation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appellation
      @appellation = Appellation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appellation_params
      params.require(:appellation).permit(:name, :location)
    end
end
