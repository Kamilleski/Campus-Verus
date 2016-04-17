class School < ActiveRecord::Base

  STATES =
    [
      "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID",
      "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS",
      "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK",
      "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV",
      "WI", "WY", "GU", "PR", "VI", "DC"
    ].freeze

  validates :name, presence: true
  validates :state, presence: true
  validates :state, inclusion: { in: STATES }
  validates :nickname, presence: true
  validates :motto, presence: true
  validates :email_domain, presence: true
  validates :undergrad_population, numericality: true
  validates :graduate_population, numericality: true
  validates :public, presence: true
  validates :logo, presence: true
  validates :mascot, presence: true
  validates :date_founded, numericality: true

  def self.search(query)
    where("name ilike ?", "%#{query}%")
  end
end