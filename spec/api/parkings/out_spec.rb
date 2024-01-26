require 'rails_helper'

RSpec.describe "Parkings", type: :request do
  before(:each) do
    @plate = Plate.create(plate: 'ABC-1234')
    @parking_record = ParkingRecord.create(plate: @plate)
    @parking_record_already_left = ParkingRecord.create(plate: @plate, left_at: Time.now)
  end

  describe "PUT /parkings/:id/out" do
    context "with valid attributes" do
      it "updates a parking" do
        put "/parkings/#{ @parking_record[:id] }/out"
        expect(response).to have_http_status(200)
        expect(response.body).to include("ABC-1234")
        json_response = JSON.parse(response.body)
        expect(json_response['parking_record']['left']).not_to be_nil
      end
    end

    context "with valid attributes but already left" do
      it "does not update a parking" do
        put "/parkings/#{ @parking_record_already_left[:id] }/out"
        expect(response).to have_http_status(404)
        expect(response.body).to include("registro não encontrado")
      end
    end

    context "with invalid attributes" do
      it "does not update a parking" do
        put "/parkings/0/out"
        expect(response).to have_http_status(404)
        expect(response.body).to include("registro não encontrado")
      end
    end
  end
end
