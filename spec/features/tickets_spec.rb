require 'rails_helper'

RSpec.feature "Tickets' feature", type: :feature do
  before do
    @event = Event.create!(
      starts_at: 1.day.ago,
      extended_html_description: 'event have search string',
      name: 'Event',
      venue: Venue.create!(name: 'Venue'),
      category: Category.create!(name: 'Entertainment')
    )
  end

  scenario "redirect to homepage and notice users when event already started" do
    visit new_event_ticket_path(@event)
    expect(page.current_path).to eq root_path
    expect(page).to have_text('Sorry, this event started, you should view another one!')
  end
end
