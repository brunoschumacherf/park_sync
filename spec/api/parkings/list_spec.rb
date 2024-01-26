require 'rails_helper'

RSpec.describe "Parkings", type: :request do
  before(:each) do
    @plate = Plate.create(plate: 'ABC-3111')
    @plate_two = Plate.create(plate: 'ABC-3456')
    @plate_three = Plate.create(plate: 'ABC-1456')
    @plate_four = Plate.create(plate: 'ABC-2456')
    3.times { ParkingRecord.create(plate: @plate) }
    2.times { ParkingRecord.create(plate: @plate_two) }
    ParkingRecord.create(plate: @plate_three)
  end

  describe "GET /parkings" do
    it "returns all parkings" do
      get "/parkings/#{@plate.plate}"
      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response['parking_records'].length).to eq(3)
    end
  end

  describe "GET /parkings/:plate" do
    it "returns all parkings from a plate" do
      get "/parkings/#{@plate_two.plate}"
      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response['parking_records'].length).to eq(2)
    end
  end

  describe "GET /parkings/:plate" do
    it "returns all parkings from a plate" do
      get "/parkings/#{@plate_three.plate}"
      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response['parking_records'].length).to eq(1)
    end
  end

  describe "GET /parkings/:plate" do
    it "returns all parkings from a plate" do
      get "/parkings/#{@plate_four.plate}"
      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response['parking_records'].length).to eq(0)
    end
  end

  describe "GET /parkings/:plate" do
    it "returns error when plate is invalid" do
      get "/parkings/ABC-123"
      expect(response).to have_http_status(404)
      expect(response.body).to include("Placa não encontrada")
    end
  end
end
