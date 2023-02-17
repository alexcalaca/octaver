class Instrument < ApplicationRecord
  mount_uploader :image, ImageUploader
  serialize :image, JSON # It is used because of sqlite

  belongs_to :user, optional: true
end
