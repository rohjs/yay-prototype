class Course < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :requirements, dependent: :destroy
  accepts_nested_attributes_for :requirements, allow_destroy: true

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

  def course_category_str
    I18n.t("activerecord.attributes.course.category_types.#{self.category}")
  end

  def course_level_str
    I18n.t("activerecord.attributes.course.level_types.#{self.level}")
  end

  def course_credit_str
    I18n.t("activerecord.attributes.course.credit_types.#{self.credit}")
  end
end
