class ParkingsController < ApplicationController
  def create
    plate = Plate.find_or_create_by(plate: params_plate[:plate])
    return render json: { message: plate.errors.full_messages }, status: 400 unless plate.save

    parking_record = ParkingRecord.new(plate: plate)
    if parking_record.save
      render json: { message: 'Entrada liberada', parking_record: parking_record.map }, status: :created
    else
      render json: { message: parking_record.errors.full_messages }, status: 400
    end
  end

  def out
    parking_record = ParkingRecord.where(id: params[:id], left_at: nil).first
    if parking_record
      parking_record.update(left_at: Time.now)
      render json: { message: 'Saída liberada', parking_record: parking_record.map }, status: 200
    else
      render json: { message: 'registro não encontrado' }, status: 404
    end
  end

  def pay
    parking_record = ParkingRecord.where(id: params[:id], paid: false).first
    if parking_record
      parking_record.update(paid: true)
      render json: { message: 'Pagamento efetuado', parking_record: parking_record.map }, status: 200
    else
      render json: { message: 'registro não encontrado' }, status: 404
    end
  end

  def list
    byebug
    plates = Plate.where(plate: params[:plate]).first
    if plates
      parking_records = plates.parking_records
      render json: { parking_records: ParkingRecord.map_parking_records(parking_records) }, status: 200
    else
      render json: { message: 'Placa não encontrada' }, status: 404
    end
  end

  def params_plate
    params.require(:parking).permit(:plate)
  end
end
