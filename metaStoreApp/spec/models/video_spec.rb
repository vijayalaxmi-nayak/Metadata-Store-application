# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Video, type: :model do
  it 'should update timecode based on the value of duration passed' do
    @account = FactoryBot.create(:account)
    @metadata = FactoryBot.build(:video, account_id: @account.id, duration:
12000)
    # byebug
    expect(Video.duration_tc(@metadata.duration)).to eq('00:00:12:00')
  end
end
