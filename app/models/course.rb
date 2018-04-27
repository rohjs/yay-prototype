class Course < ApplicationRecord
  belongs_to :teacher

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
    3_credit: 0,
    6_credit: 1,
    9_credit: 2,
    12_credit: 3,
    15_credit: 4
  }

end