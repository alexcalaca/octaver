class Instrument < ApplicationRecord
  mount_uploader :image, ImageUploader
  serialize :image, JSON # It is used because of sqlite
end
