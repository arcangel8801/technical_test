require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    let(:event_one) do
      { name: 'Event one', starts_at: Date.today, ends_at: (Date.today + 1.day),
        schedules_attributes: { 0 => { week_day: '1',
                                       schedule_details_attributes: { 0 => {
                                         hour: '2:00 PM',
                                         coupons: '20'
                                } }
        } }
      }
    end

    it 'add event' do
      expect do
        post :create, params: { event: event_one }
      end.to change(Event, :count).by(1)
    end
  end

end
