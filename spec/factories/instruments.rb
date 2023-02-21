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
FactoryBot.define do
  factory :instrument do
    brand { "Fender" }
    model { "Model" }
    description { "Description" }
    condition { "New" }
    finish { "Black" }
    title { "Title" }
    price { 99.87 }
    image { "string" }    
  end
end
