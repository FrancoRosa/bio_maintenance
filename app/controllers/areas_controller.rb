class AreasController < ApplicationController
  before_action :set_area, only: %i[show edit update destroy]

  # GET /areas or /areas.json
  def index
    @areas = Area.all
    @facilities = Facility.all
  end

  # GET /areas/1 or /areas/1.json
  def show; end

  # GET /areas/new
  def new
    @area = Area.new
    @facilities = Facility.all
  end

  # GET /areas/1/edit
  def edit
    @facilities = Facility.all
  end

  # POST /areas or /areas.json
  def create
    @area = Area.new(area_params)
    @facilities = Facility.all

    respond_to do |format|
      if @area.save
        format.html { redirect_to @area, notice: 'Area was successfully created.' }
        format.json { render :show, status: :created, location: @area }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /areas/1 or /areas/1.json
  def update
    respond_to do |format|
      if @area.update(area_params)
        format.html { redirect_to @area, notice: 'Area was successfully updated.' }
        format.json { render :show, status: :ok, location: @area }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /areas/1 or /areas/1.json
  def destroy
    @area.destroy
    respond_to do |format|
      format.html { redirect_to areas_url, notice: 'Area was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_area
    @area = Area.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def area_params
    params.require(:area).permit(:name, :location, :contact_name, :contact_phone, :facility_id)
  end
end
