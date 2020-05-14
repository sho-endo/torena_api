class Part < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 30 },
                   uniqueness: { scope: :user_id, case_sensitive: true }
  validates :user_id, presence: true

  has_many :menus, -> { order "updated_at DESC" }, dependent: :destroy
end
