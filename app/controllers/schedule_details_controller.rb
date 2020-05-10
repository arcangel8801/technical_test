class ScheduleDetailsController < ApplicationController
  before_action :set_schedule_detail, only: [:show, :edit, :update, :destroy]

  # GET /schedule_details
  # GET /schedule_details.json
  def index
    @schedule_details = ScheduleDetail.all
  end

  # GET /schedule_details/1
  # GET /schedule_details/1.json
  def show
  end

  # GET /schedule_details/new
  def new
    @schedule_detail = ScheduleDetail.new
  end

  # GET /schedule_details/1/edit
  def edit
  end

  # POST /schedule_details
  # POST /schedule_details.json
  def create
    @schedule_detail = ScheduleDetail.new(schedule_detail_params)

    respond_to do |format|
      if @schedule_detail.save
        format.html { redirect_to @schedule_detail, notice: 'Schedule detail was successfully created.' }
        format.json { render :show, status: :created, location: @schedule_detail }
      else
        format.html { render :new }
        format.json { render json: @schedule_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedule_details/1
  # PATCH/PUT /schedule_details/1.json
  def update
    respond_to do |format|
      if @schedule_detail.update(schedule_detail_params)
        format.html { redirect_to @schedule_detail, notice: 'Schedule detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule_detail }
      else
        format.html { render :edit }
        format.json { render json: @schedule_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedule_details/1
  # DELETE /schedule_details/1.json
  def destroy
    @schedule_detail.destroy
    respond_to do |format|
      format.html { redirect_to schedule_details_url, notice: 'Schedule detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule_detail
      @schedule_detail = ScheduleDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def schedule_detail_params
      params.require(:schedule_detail).permit(:schedule_id, :hour, :coupons)
    end
end
