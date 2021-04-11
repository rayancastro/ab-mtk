class AbTest < ApplicationRecord
  belongs_to :shop
  has_many :segments
  has_secure_token
end
