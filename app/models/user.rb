class User < ApplicationRecord
  require 'carrierwave/orm/activerecord'
  mount_uploader :profile, ProfileUploader

  has_many :assignments
  has_and_belongs_to_many :courses

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
