require 'rails_helper'

RSpec.describe "Parkings", type: :request do
  describe "POST /parkings" do
    context "with valid attributes" do
      it "creates a parking" do
        post "/parkings", params: { parking: { plate: 'ABC-1234' } }
        expect(response).to have_http_status(:created)
        expect(response.body).to include("ABC-1234")
      end
    end

    context "with invalid attributes" do
      it "does not create a parking" do
        post "/parkings", params: { parking: { plate: 'ABC1234' } }
        expect(response).to have_http_status(400)
        expect(response.body).to include("não é válido")
      end
    end

    context "with empty attributes" do
      it "does not create a parking" do
        post "/parkings", params: { parking: { plate: '' } }
        expect(response).to have_http_status(400)
        expect(response.body).to include("não pode ficar em branco")
      end
    end
  end
end
