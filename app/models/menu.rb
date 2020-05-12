class Menu < ApplicationRecord
  belongs_to :part

  validates :name, presence: true, length: { maximum: 50 },
            uniqueness: { scope: :part_id, case_sensitive: true }
  validates :part_id, presence: true
end
