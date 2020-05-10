class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.references :event, foreign_key: true
      t.integer :week_day
      t.date :standard_date

      t.timestamps
    end
  end
end
