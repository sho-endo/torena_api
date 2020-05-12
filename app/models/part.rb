class Part < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 30 },
                   uniqueness: { scope: :user_id, case_sensitive: true }
  validates :user_id, presence: true
end
