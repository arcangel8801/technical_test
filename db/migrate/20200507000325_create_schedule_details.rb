class CreateScheduleDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :schedule_details do |t|
      t.references :schedule, foreign_key: true
      t.string :hour
      t.integer :coupons

      t.timestamps
    end
  end
end
