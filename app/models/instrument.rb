# == Schema Information
#
# Table name: instruments
#
#  id          :integer          not null, primary key
#  brand       :string
#  model       :string
#  description :text
#  condition   :string
#  finish      :string
#  title       :string
#  price       :decimal(5, 2)    default(0.0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#  user_id     :integer
#
class Instrument < ApplicationRecord
  mount_uploader :image, ImageUploader
  serialize :image, JSON # It is used because of sqlite

  belongs_to :user, optional: true

  #%w is a syntax sugar for arrays["", ""]
  BRAND = %w{ Fender Gibson Epiphone ESP Martin Dean Taylor Jackson PRS 
              Ibanez Charvel Washburnhure Yamaha Steinway Sennheiser
              Roland Kawai }

  FINISH = %w{ Black White Navy Blue Red Clear Satin Yellow Seafoam }

  CONDITION = %w{ New Excellent Mint Used Fair Poor }
end
