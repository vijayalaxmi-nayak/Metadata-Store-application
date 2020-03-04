# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Api::V1::MediasController, type: :controller do
  before(:context) do
    @account = FactoryBot.create(:account)
  end

  after(:context) do
    @account.destroy
  end

  context 'GET #index' do
    it 'should return a success response' do
     for i in 60..65 do
        FactoryBot.create(:media, account_id: @account.id, title: i.to_s +
'xYz', asset_id: i.to_s + 'abc', duration: i)
      end
      for i in 60..65 do
        FactoryBot.create(:media, account_id: @account.id, title: i.to_s +
'Abc', asset_id: i.to_s + 'xyz', duration: i)
      end       
     get :index, params: { asset_id: 'ABc', title: 'yz', duration: 62 }
     expect(response).to be_success
    end

    it 'should return a successful json string with message' do
      for i in 60..65 do
        FactoryBot.create(:media, account_id: @account.id, title: i.to_s +
'xYz', asset_id: i.to_s + 'abc', duration: i)
      end
      for i in 60..65 do
        FactoryBot.create(:media, account_id: @account.id, title: i.to_s +
'Abc', asset_id: i.to_s + 'xyz', duration: i)
      end
      get :index, params: { asset_id: 'ABc', title: 'yz', duration: 62 }
      expect(response).to be_success
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['message']).to eq('Loaded medias')
    end

    it 'should return a successful json string with data' do
      FactoryBot.create(:media, account_id: @account.id, title: '10xYz',
asset_id: '10abc', duration: 61)
      for i in 60..65 do
        FactoryBot.create(:media, account_id: @account.id, title: i.to_s +
'Abc', asset_id: i.to_s + 'xyz', duration: i)
      end
      get :index, params: { asset_id: 'ABc', title: 'yz', duration: 62 }
      expect(response).to be_success
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['data'][0]['asset_id']).to eq('10abc')
    end
  end
end
