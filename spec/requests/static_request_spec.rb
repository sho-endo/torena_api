require 'rails_helper'

RSpec.describe "Statics", type: :request do

  describe "GET /" do
    it 'should return "Hello World"' do
      is_expected.to eq(200)

      res = JSON.parse(response.body)
      expect(res["message"]).to eq("Hello World")
    end
  end
end
