class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.references :event, foreign_key: true
      t.integer :week_day
      t.date :current_date
      t.integer :hour
      t.integer :minute
      t.integer :coupons

      t.timestamps
    end
  end
end
