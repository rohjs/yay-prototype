class Requirement < ApplicationRecord
  belongs_to :course
  has_may :assignments
end
