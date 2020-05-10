require 'rails_helper'

RSpec.describe ScheduleDetail, type: :model do
  it { should validate_presence_of(:hour) }
  it { should validate_numericality_of(:coupons) }

  it { should belong_to(:schedule) }
end
