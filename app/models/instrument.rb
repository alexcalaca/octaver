class Instrument < ApplicationRecord
  mount_uploader :image, ImageUploader
end
