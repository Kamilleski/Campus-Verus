class Student < ActiveRecord:: Base
  belongs_to :school

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  COLLEGE_YEARS = ["Freshman", "Sophomore", "Junior", "Senior", "Super Senior", "Grad Student"]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :photo_url, presence: true
  validates :interests, presence: true
  validates :year_in_college, presence: true, inclusion: { in: COLLEGE_YEARS }
  validates :living_situation, presence: true
  validates :hometown, presence: true

  validates :school, presence: true

end
