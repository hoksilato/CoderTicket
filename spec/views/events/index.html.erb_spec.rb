# Using below command to generating this view test
# rails g rspec:view events index
require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before do
    @event1 = Event.create!( # variable has '@' is global variable, it can be used in all methods
      starts_at: 1.day.ago,
      extended_html_description: 'event have search string',
      name: 'Event 1',
      hero_image_url: 'http://example.com/image1.jpg',
      venue: Venue.create!(name: 'Venue 1'),
      category: Category.create!(name: 'Entertainment')
    )
    @event2 = Event.create!(
      starts_at: 1.day.from_now,
      extended_html_description: 'description',
      name: 'Event 2',
      hero_image_url: 'http://example.com/image2.jpg',
      venue: Venue.create!(name: 'Venue 2'),
      category: Category.create!(name: 'Everything Else')
    )
  end

  it "renders _card partial for each event" do
    assign(:events, [@event1, @event2])
    render
    expect(view).to render_template(:partial => "_card", :count => 2)
  end
end
