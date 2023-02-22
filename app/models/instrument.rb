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
  has_many :line_items

  #%w is a syntax sugar for arrays["", ""]
  BRAND = %w{ Fender Gibson Epiphone ESP Martin Dean Taylor Jackson PRS 
    Ibanez Charvel Washburnhure Yamaha Steinway Sennheiser
    Roland Kawai }

  #%w is a syntax sugar for arrays["", ""]
  CONDITION = %w{ New Excellent Mint Used Fair Poor }
  
  validates :brand, presence: true
  validates :brand, inclusion: { in: BRAND }, allow_nil: true

  validates :condition, inclusion: { in: CONDITION }, allow_nil: true
  validates :condition, presence: true

  validates :title, format: { with: /\A[a-zA-Z0-9_\- ]+\z/ }

  
  validates :model, presence: true
  validates :description, presence: true
  validates :finish, presence: true

  

  

  

  FINISH = %w{ Black White Navy Blue Red Clear Satin Yellow Seafoam }

  

  
end
