require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:starts_at) }
  it { should validate_presence_of(:ends_at) }

  it { should have_many(:schedules).dependent(:destroy) }
end
