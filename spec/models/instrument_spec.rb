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
require 'rails_helper'

RSpec.describe Instrument, type: :model do
  it "can run tests" do
    expect(true).to be(true)
  end

  before(:all) do
    @instrument1 = create(:instrument)
  end  

  it "is valid with valid attributes" do
    expect(@instrument1).to be_valid
  end

  describe "#brand" do  
    it "includes one brand of the list" do
      #setup
      @instrument1.brand = "Fender"
  
      #exercise
      @instrument1.valid?

      #verify
      expect(@instrument1.errors[:brand].size).to eq(0)
  
      #teardown is handled by RSpec          
    end

    it "includes only allowed brands" do
      #setup      
      instrument2 = build(:instrument, brand: "Nintendo")

      #exercise and #verify
      expect(instrument2).to_not be_valid      
    end

    it "is required" do
      #setup
      another_instrument = build(:instrument, brand: nil)
  
      #exercise
      another_instrument.valid?

      #verify
      expect(another_instrument.errors[:brand]).to include("can't be blank")
        
      #teardown is handled by RSpec
    end

    it "ss only allowed brands" do
      #setup      
      instrument2 = build(:instrument, brand: nil)

      #exercise and #verify
      expect(instrument2).to_not be_valid      
    end
  
  end

  describe "#model" do
    it "is required" do
      #setup
      another_instrument = build(:instrument, model: nil)

      #exercise
      another_instrument.valid?

      #verify
      expect(another_instrument.errors[:model].size).to be >= 1
      #teardown
    end
  end

  describe "#description" do
    context "with valid params" do
      it "is required" do
      end
    end

    context "given invalid params" do
      it "is invalid with no description" do
        another_instrument = build(:instrument, description: nil)

        another_instrument.valid?

        expect(another_instrument.errors[:description]).to include("can't be blank")
      end
    end

    context "given valid params" do
      it "is valid with description" do
        #setup
        another_instrument = build(:instrument,
          description: "beautiful description")

        #exercise
        another_instrument.valid?

        #verify
        expect(another_instrument.errors[:description].size).to eq(0)          
      end
    end
  end

  describe "#finish" do
    context "with invalid params" do
      it "returns failure when finish is missing" do
        #setup        
        another_instrument = build(:instrument, finish: nil)
    
        #exercise
        another_instrument.valid?

        #verify
        expect(another_instrument.errors[:finish]).to include("can't be blank")
          
        #teardown is handled by RSpec
      end
    end
  end

  describe "#condition" do
    context "valid entry" do
      Instrument::CONDITION.each do |condition_allowed|

        it "is valid" do
          expect((build(:instrument, condition: condition_allowed)).errors[:condition].size).to eq(0)
          #expect(another_instrument.errors[:brand]).to include("can't be blank")
      #    expect(@instrument1.errors[:brand].size).to eq(0)
        end
      end
    end

    context "invalid entry" do
      ["Never", "Nothing", "Disney", "Beach"].each do |condition_not_allowed|

        it "is invalid with #{condition_not_allowed}" do
          #setup
          another_instrument = build(:instrument, condition: condition_not_allowed)
          
          #exercise
          another_instrument.valid?

          #verify
          expect(another_instrument.errors[:condition]).to include("is not included in the list")

          #teardown            
        end
      end      
    end    
  end

  describe "#title" do
    context "valid entry" do
      it "is valid given letters and spaces" do
        ["Guitar 2023-", "Crazy Bass"].each do |title_allowed|
          #setup
          another_instrument = build(:instrument, title: title_allowed)

          #exercise
          another_instrument.valid?

          #verify
          expect(another_instrument.errors[:title].size).to eq(0)
          
          #teardown
        end
      end
    end

    context "invalid entry" do
      it "is invalid given any other characters than letters and numbers" do
        ["!@#$%&*test", "()+=[]test;.,"].each do |characters_not_allowed|
          #setup
          another_instrument = build(:instrument, title: characters_not_allowed)

          #exercise
          another_instrument.valid?

          #verify
          expect(another_instrument.errors[:title]).to include("is invalid")
        end

      end
    end
  end
  
    
end
