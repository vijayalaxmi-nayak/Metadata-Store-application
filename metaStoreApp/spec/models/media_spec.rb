# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Media, type: :model do
  before(:context) do
    @account = FactoryBot.create(:account)
    # byebug
  end

  after(:context) do
    @account.destroy
    # byebug
  end

  context 'validation test' do
=begin
    it 'should not create a media record on validation failure of duration not
being integer' do
      metadata = FactoryBot.build(:media, account_id: @account.id, :duration:
'xyz')
      expect { metadata.save }.to raise_error
      # byebug
    end
=end

    it 'should create a media record on validation success' do
      metadata = FactoryBot.build(:media, account_id: @account.id)
      status = metadata.save
      expect(status).to eq(true)
    end
  end

  context 'testcases for display medias based on searches and filters' do
    it 'should search by asset_id if only asset_id param is passed' do
      for i in 1..10 do
	FactoryBot.create(:media, account_id: @account.id, asset_id: i.to_s +
'100')
      end
      metadata = Media.search_by_asset_id('2')
      expect(metadata.pluck(:asset_id)[0]).to eq('2100')
    end

    it 'should search by title if only title param is passed' do
      for i in 1..3 do
	FactoryBot.create(:media, account_id: @account.id, title: i.to_s +
'xYz', asset_id: i.to_s + 'xyz')
      end
      for i in 1..3 do
	FactoryBot.create(:media, account_id: @account.id, title: i.to_s +
'Xav', asset_id: i.to_s + 'abc')
      end
      metadata = Media.search_by_title('XYZ')
      expect(metadata.pluck(:title)).to eq(["1xYz", "2xYz", "3xYz"])
    end

    it 'should search by asset_id, title, and duration if all three params are
provided' do
      for i in 60..65 do
	FactoryBot.create(:media, account_id: @account.id, title: i.to_s +
'xYz', asset_id: i.to_s + 'abc', duration: i)
      end
      for i in 60..65 do
	FactoryBot.create(:media, account_id: @account.id, title: i.to_s +
'Abc', asset_id: i.to_s + 'xyz', duration: i)
      end
      metadata = Media.search_by_asset_id('AbC')
      metadata = metadata.search_by_title('xy')
      metadata = metadata.search_by_duration(62)
      expect(metadata.pluck(:asset_id)).to eq(["60abc", "61abc", "62abc"])
    end
  end
end
