require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '#upcoming' do
    before do
      @event1 = Event.create!(
        starts_at: 1.day.ago,
        extended_html_description: 'description',
        name: 'Event 1',
        venue: Venue.create!(name: 'Venue 1'),
        category: Category.create!(name: 'Entertainment')
      )
      @event2 = Event.create!(
        starts_at: 1.day.from_now,
        extended_html_description: 'description',
        name: 'Event 2',
        venue: Venue.create!(name: 'Venue 2'),
        category: Category.create!(name: 'Everything Else')
      )
    end

    it 'returns only upcoming events' do
      expect(Event.upcoming).to match_array([@event2])
    end
  end
end
