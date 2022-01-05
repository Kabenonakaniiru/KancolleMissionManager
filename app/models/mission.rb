class Mission < ApplicationRecord
  belongs_to :classification
  validates :name, presence: true
  validates :classification_id, presence: true
  validates :url, length: { minimum: 7, maximum: 255 } # TODO: 後で精査(特にURLの長さ)
  validates :note, length: { maximum: 255 }
end
