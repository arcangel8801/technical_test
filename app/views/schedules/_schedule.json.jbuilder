json.extract! schedule, :id, :event_id, :week_day, :current_date, :hour, :minute, :coupons, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)
