require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event1 = Event.create!( # variable has '@' is global variable, it can be used in all methods
      starts_at: 1.day.ago,
      extended_html_description: 'event have search string',
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

  describe '#upcoming' do
    it 'returns only upcoming events' do
      expect(Event.upcoming).to match_array([@event2])
    end
  end

  describe '#search' do
    it 'returns events have name and description include search string' do
      search_string = 'search string'
      expect(Event.search(search_string)).to match_array([@event1])
    end
  end
end
