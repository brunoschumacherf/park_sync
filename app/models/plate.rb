class Plate
  include Mongoid::Document

  field :plate, type: String

  has_many :parking_records, class_name: 'ParkingRecord'

  validates :plate, format: { with: /\A[A-Z]{3}-[0-9]{4}\z/, message: "não é válido" }
  validates :plate, presence: { message: "não pode ficar em branco" }
end
