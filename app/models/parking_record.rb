class ParkingRecord
  include Mongoid::Document
  include Mongoid::Timestamps

  field :paid, type: Boolean, default: false
  field :left_at, type: DateTime

  belongs_to :plate, class_name: 'Plate'
  validates :plate, presence: { message: "não pode ficar em branco" }

  def self.map_parking_records(parking_records)
    parking_records.map do |parking_record|
      byebug
      {
        id: parking_record.id.to_s,
        paid: parking_record.paid,
        left: parking_record.left_at.present?,
        time: "#{parking_record.left_at.present? ? calc_minutes_and_seconds(parking_record.left_at, parking_record.created_at) : 'not left'} minutes",
      }
    end
  end

  def map
    {
      id: id.to_s,
      paid: paid,
      left: left_at.present?,
      plate: plate.plate
    }
  end

  def self.calc_minutes_and_seconds(left_at, created_at)
    minutes = ((left_at.to_time - created_at.to_time) / 60).round
    minutes
  end
end
