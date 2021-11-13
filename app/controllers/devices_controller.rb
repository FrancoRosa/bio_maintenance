class DevicesController < ApplicationController
  before_action :require_password_verification
  before_action :set_device, only: %i[show edit update destroy report]

  # GET /devices or /devices.json
  def index
    @devices = Device.all
  end

  # GET /devices/1 or /devices/1.json
  def show; end

  # GET /devices/new
  def new
    @device = Device.new
    @facilities = Facility.all
    @device_types = DeviceType.all
    @critical_levels = CriticalLevel.all
  end

  # GET /devices/1/edit
  def edit; end

  # POST /devices or /devices.json
  def create
    @device = Device.new(device_params)
    @facilities = Facility.all

    respond_to do |format|
      if @device.save
        format.html { redirect_to @device, notice: 'Device was successfully created.' }
        format.json { render :show, status: :created, location: @device }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devices/1 or /devices/1.json
  def update
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to @device, notice: 'Device was successfully updated.' }
        format.json { render :show, status: :ok, location: @device }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1 or /devices/1.json
  def destroy
    @device.destroy
    respond_to do |format|
      format.html { redirect_to devices_url, notice: 'Device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def report
    @facility = @device.area.facility
    @area = @device.area
    @device_type = @device.device_type
    @actions = get_actions(@device_type.protocol)
    @format_code = get_format_code(@device)
  end

  def next_maintenances
    @devices = Device.all
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_device
    @device = Device.find(params[:id])
    @facilities = Facility.all
    @device_types = DeviceType.all
    @critical_levels = CriticalLevel.all
    @facility = @device.area.facility
    @area = @device.area
    @critical_level = @device.critical_level
    @device_type = @device.device_type
  end

  # Only allow a list of trusted parameters through.
  def device_params
    params.require(:device).permit(:name, :brand, :model, :serial, :last_maintenance, :area_id, :device_type_id,
                                   :critical_level_id)
  end

  def get_actions(protocol)
    limit = 10
    actions = protocol.split("\n")
    actions.map!(&:strip)

    if actions.length >= limit
      actions.take(limit)
    else
      pad = limit - actions.length
      pad.times { |_i| actions.push('') }
      actions
    end
  end

  def get_format_code(device)
    id = device.id.to_s
    maintenances = (device.maintenances.count + 1).to_s
    id = id.rjust(4, '0')
    maintenances = maintenances.rjust(4, '0')
    "#{id} - #{maintenances}"
  end
end
