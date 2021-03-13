class Segment < ApplicationRecord
  belongs_to :ab_test

  has_secure_token :ab_token

  validates :name, presence: true
end
