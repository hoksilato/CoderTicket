require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  before do
    @event1 = Event.create!(
      starts_at: 1.day.ago,
      extended_html_description: 'event have search string',
      name: 'Event 1',
      venue: Venue.create!(name: 'Venue 1'),
      category: Category.create!(name: 'Entertainment')
    )
    @event2 = Event.create!(
      starts_at: 1.day.from_now,
      extended_html_description: 'description',
      name: 'Event 2 with name contains search string',
      venue: Venue.create!(name: 'Venue 2'),
      category: Category.create!(name: 'Everything Else')
    )
    @event3 = Event.create!(
      starts_at: 2.day.from_now,
      extended_html_description: 'also contains search string',
      name: 'Event 2',
      venue: Venue.create!(name: 'Venue 3'),
      category: Category.create!(name: 'Learning')
    )
  end

  describe 'GET #index' do
    it 'loads only upcoming events into @events when search string is empty' do
      get :index, search: ''
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(assigns(:events)).to eq([@event2, @event3])
      expect(response).to render_template('index')
    end

    it 'loads only upcoming events have name or description contains search string' do
      get :index, search: 'search string'
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(assigns(:events)).to eq([@event2, @event3])
      expect(response).to render_template('index')
    end
  end
end
