require 'rails_helper'

describe Plate, type: :model do
  it "is valid with valid attributes" do
    plate = Plate.new(plate: 'ABC-1234')
    expect(plate).to be_valid
  end

  it "is not valid without a plate" do
    plate = Plate.new(plate: nil)
    plate.valid?
    expect(plate.errors[:plate]).to include("não pode ficar em branco")
  end

  it "is not valid with a plate with invalid format" do
    plate = Plate.new(plate: 'ABC1234')
    plate.valid?
    expect(plate.errors[:plate]).to include("não é válido")
  end
end
