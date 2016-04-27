class School < ActiveRecord::Base
  has_many :students

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
  validates_inclusion_of :public, in: [true, false]
  validates :logo, presence: true
  validates :mascot, presence: true
  validates :date_founded, numericality: true

  paginates_per 5

  def self.search(query)
    where("name ilike ?", "%#{query}%")
  end

  def get_news(key, keyword)
    url = "http://api.nytimes.com/svc/search/v2/articlesearch.json?q=#{keyword}&api-key=#{key}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    parsed_crap = JSON.parse(response)
    return @top_news = parsed_crap["response"]["docs"]
  end

  def get_crime(key, city, state)
    key = 'PPQiVIcYEVfuzIdNIhjo805N3'
    url= "PPQiVIcYEVfuzIdNIhjo805N3"
    uri = URI(url)
    response = Net::HTTP.get_response(uri)
    parsed_data = JSON.parse(response.body)
    @current_weather = parsed_data["currently"]["summary"]
    @future_weather = parsed_data["minutely"]["summary"]
    @temperature = parsed_data["currently"]["temperature"]
  end
end
