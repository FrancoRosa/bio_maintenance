class CriticalLevelsController < ApplicationController
  before_action :set_critical_level, only: %i[ show edit update destroy ]

  # GET /critical_levels or /critical_levels.json
  def index
    @critical_levels = CriticalLevel.all
  end

  # GET /critical_levels/1 or /critical_levels/1.json
  def show
  end

  # GET /critical_levels/new
  def new
    @critical_level = CriticalLevel.new
  end

  # GET /critical_levels/1/edit
  def edit
  end

  # POST /critical_levels or /critical_levels.json
  def create
    @critical_level = CriticalLevel.new(critical_level_params)

    respond_to do |format|
      if @critical_level.save
        format.html { redirect_to @critical_level, notice: "Critical level was successfully created." }
        format.json { render :show, status: :created, location: @critical_level }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @critical_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /critical_levels/1 or /critical_levels/1.json
  def update
    respond_to do |format|
      if @critical_level.update(critical_level_params)
        format.html { redirect_to @critical_level, notice: "Critical level was successfully updated." }
        format.json { render :show, status: :ok, location: @critical_level }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @critical_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /critical_levels/1 or /critical_levels/1.json
  def destroy
    @critical_level.destroy
    respond_to do |format|
      format.html { redirect_to critical_levels_url, notice: "Critical level was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_critical_level
      @critical_level = CriticalLevel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def critical_level_params
      params.require(:critical_level).permit(:name, :frecuency)
    end
end
