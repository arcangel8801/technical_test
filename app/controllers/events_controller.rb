class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :set_week_days, only: %i[new edit create update]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    @event.schedules.build
  end

  # GET /events/1/edit
  def edit
    gon.starts_at = @event.starts_at
    gon.ends_at = @event.ends_at
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.schedules.build
    busy_days = []
    if @event.starts_at.present? && @event.ends_at.present?
      event_params[:schedules_attributes].each do |_schedule_key, schedule_attribute|
        next if busy_days.include?(schedule_attribute[:week_day])

        busy_days.push(schedule_attribute[:week_day])

        (@event.starts_at..@event.ends_at).each do |date|
          next unless schedule_attribute[:week_day].present? && date.wday == schedule_attribute[:week_day].to_i

          schedule_attribute[:standard_date] = date
          schedule = @event.schedules.build(schedule_attribute)
          schedule.schedule_details.destroy_all

          busy_hours = []
          schedule_attribute[:schedule_details_attributes].each do |_detail_key, details|
            next if busy_hours.include?(details[:hour])

            busy_hours.push(details[:hour])
            schedule.schedule_details.build(details)
          end

        end

      end
    end

    @event.schedules = @event.schedules[1..-1] if @event.schedules.size > 1

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: I18n.t('controllers.events.create') }
        format.json { render :show, status: :created, location: @event }
      else
        restore_information(event_params[:schedules_attributes]) if @event.schedules.size > 1
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.save
        original_settings.destroy_all
        format.html { redirect_to @event, notice: I18n.t('controllers.events.update') }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: I18n.t('controllers.events.destroy') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:name, :starts_at, :ends_at,
                                  schedules_attributes: [:week_day,
                                                         schedule_details_attributes: %i[hour coupons]])
  end

  def set_week_days
    @week_days = []
    I18n.t('date.day_names').each_with_index { |day, index| @week_days << [day, index] }
    @week_days
  end

  def restore_information(schedules_attributes)
    @event.schedules.destroy_all
    schedules_attributes.each do |_schedule_key, schedule_attribute|
      schedule = @event.schedules.build(schedule_attribute)
      schedule.schedule_details.destroy_all

      schedule_attribute[:schedule_details_attributes].each do |_detail_key, details|
        schedule.schedule_details.build(details)
      end
    end
  end
end
