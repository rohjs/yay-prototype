class Course < ApplicationRecord
  belongs_to :user
  has_many :requirements

  enum level: {
    introductory: 0,
    basic: 1,
    intermediate: 2,
    advanced: 3,
  }

  enum category: {
    programming: 0,
    data_science: 1,
    design: 2,
    marketing: 3,
    business: 4
  }

  enum credit: {
    credit_3: 0,
    credit_6: 1,
    credit_9: 2,
    credit_12: 3,
    credit_15: 4
  }

  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :level, presence: true
  validates :credit, presence: true
  validates :capacity, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :closing_date, presence: true
  #validates :teacher_id, presence: true

end
