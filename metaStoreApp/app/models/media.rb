# frozen_string_literal: true
class Media < ApplicationRecord
  belongs_to :account
  validates :asset_id, presence: true, uniqueness: true
  validates :media_type, presence: true
  # validates :duration, numericality: { only_integer: true }

  scope :search_by_asset_id, ->(asset_id) { where "asset_id LIKE ?", "%" + asset_id + "%" }
  scope :search_by_title, ->(title) { where "title LIKE ?", "%" + title + "%" }
  scope :search_by_duration, ->(duration) { where duration: 0..(duration.to_i) }
end
