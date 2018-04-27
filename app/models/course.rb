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
    credit_3: 0,
    credit_6: 1,
    credit_9: 2,
    credit_12: 3,
    credit_15: 4
  }

end