class Tourist < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :prospective_major, presence: true
  validates :intended_start_date_semester, presence: true, inclusion: { in: ["Fall", "Spring",            "Summer", "Winter"] }
  validates :intended_start_date_year, numericality: true
end
