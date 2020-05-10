require 'rails_helper'

RSpec.describe Schedule, type: :model do
  it { should validate_numericality_of(:week_day) }

  it { should have_many(:schedule_details).dependent(:destroy) }
  it { should belong_to(:event) }
end
