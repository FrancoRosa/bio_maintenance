class MaintenancesController < ApplicationController
  before_action :require_password_verification
  skip_before_action :verify_authenticity_token
  before_action :set_maintenance, only: %i[show edit update destroy]

  # GET /maintenances or /maintenances.json
  def index
    @maintenances = Maintenance.all
  end

  # GET /maintenances/1 or /maintenances/1.json
  def show; end

  # GET /maintenances/new
  def new
    @maintenance = Maintenance.new
    @maintainers = Maintainer.all
  end

  # GET /maintenances/1/edit
  def edit
    @maintainers = Maintainer.all
  end

  # POST /maintenances or /maintenances.json
  def create
    @maintenance = Maintenance.new(maintenance_params)

    respond_to do |format|
      if @maintenance.save
        format.html { redirect_to @maintenance, notice: 'Maintenance was successfully created.' }
        format.json { render :show, status: :created, location: @maintenance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenances/1 or /maintenances/1.json
  def update
    respond_to do |format|
      if @maintenance.update(maintenance_params)
        format.html { redirect_to @maintenance, notice: 'Maintenance was successfully updated.' }
        format.json { render :show, status: :ok, location: @maintenance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenances/1 or /maintenances/1.json
  def destroy
    @maintenance.destroy
    respond_to do |format|
      format.html { redirect_to maintenances_url, notice: 'Maintenance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def new_maintenance
    @facilities = Facility.all
    @areas = Area.all
    @devices = Device.all
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_maintenance
    @maintenance = Maintenance.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def maintenance_params
    params.require(:maintenance).permit(:observations, :parts, :state_before, :state_after, :maintenance_type,
                                        :diagnostic, :activities, :device_id, :maintainer_id)
  end
end
