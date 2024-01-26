require 'rails_helper'

RSpec.describe ParkingRecord, type: :model do
  it "is valid with valid attributes" do
    plate = Plate.new(plate: 'ABC-1234')
    parking_record = ParkingRecord.new(plate: plate)
    expect(parking_record).to be_valid
  end

  it "is not valid without a plate" do
    parking_record = ParkingRecord.new(plate: nil)
    parking_record.valid?
    expect(parking_record.errors[:plate]).to include("não pode ficar em branco")
  end
end
