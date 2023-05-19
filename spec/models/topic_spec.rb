# == Schema Information
#
# Table name: topics
#
#  id         :bigint           not null, primary key
#  label      :string
#  icon       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

# RSpec.describe Topic, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

RSpec.describe Api::V1::TopicsController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(200)
    end

    it 'returns all topics in JSON format' do
      topic1 = create(:topic, label: Faker::Lorem.word, icon: Faker::Lorem.word)
      topic2 = create(:topic, label: Faker::Lorem.word, icon: Faker::Lorem.word)
      get :index
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq(2)
      expect(json_response[0]['label']).to eq(topic1.label)
      expect(json_response[1]['label']).to eq(topic2.label)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) { { topic: { label: Faker::Lorem.word, icon: Faker::Lorem.word } } }

      it 'creates a new topic' do
        expect {
          post :create, params: valid_params
        }.to change(Topic, :count).by(1)
      end

      it 'returns the created topic in JSON format' do
        post :create, params: valid_params
        expect(response).to have_http_status(200)
        json_response = JSON.parse(response.body)
        expect(json_response['label']).to eq(valid_params[:topic][:label])
        expect(json_response['icon']).to eq(valid_params[:topic][:icon])
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) { { topic: { label: nil, icon: Faker::Lorem.word } } }

      it 'does not create a new topic' do
        expect {
          post :create, params: invalid_params
        }.to_not change(Topic, :count)
      end

      it 'returns an error message in JSON format' do
        post :create, params: invalid_params
        expect(response).to have_http_status(200)
        json_response = JSON.parse(response.body)
        expect(json_response['error']).to eq('Error Creating topic')
      end
    end
  end
end
