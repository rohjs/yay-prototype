class User < ApplicationRecord
  require 'carrierwave/orm/activerecord'
  mount_uploader :profile, ProfileUploader

  has_many :assignments
  has_and_belongs_to_many :courses

  enum department: {
    humanities: 0,
    social_science: 1,
    integrated_knowledge: 2,
    science: 3,
    engineering: 4,
    economics: 5,
    business_administration: 6,
    communication: 7,
    law: 8
  }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def student?
    self.user_type == 0 ? true : false
  end

  def teacher?
    self.user_type == 1 ? true : false
  end

  def user_department_str
    I18n.t("activerecord.attributes.user.department_types.#{self.department}")
  end
end
