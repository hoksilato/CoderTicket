require 'rails_helper'

RSpec.feature "Events' feature", type: :feature do
  before do
    @event = Event.create!(
      starts_at: 2.day.from_now,
      extended_html_description: 'event have search string',
      name: 'Event',
      venue: Venue.create!(name: 'Venue'),
      category: Category.create!(name: 'Entertainment')
    )
  end

  scenario 'click on an event to see details about the event' do
    visit root_path
    visit event_path(@event)
    expect(page).to have_selector('h3', text: 'Event')
  end

  scenario 'click on "Book Now" to go to a page to purchase tickets' do
    visit event_path(@event)
    click_link 'BOOK NOW'
    expect(page).to have_selector 'div.tickets-buy'
  end
end
