class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  has_many :ticket_types

  validates_presence_of :extended_html_description, :venue, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

  def self.upcoming
    where('starts_at > ?', DateTime.now)
  end

  def self.search(search)
    where('name LIKE ? OR extended_html_description LIKE ?', "%#{search}%", "%#{search}%")
  end
end
