json.extract! schedule_detail, :id, :schedule_id, :hour, :minute, :coupons, :created_at, :updated_at
json.url schedule_detail_url(schedule_detail, format: :json)
