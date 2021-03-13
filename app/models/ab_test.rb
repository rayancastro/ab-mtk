class AbTest < ApplicationRecord
  has_many :segments
  has_secure_token
end
