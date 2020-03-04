# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Audio, type: :model do
  it 'should update timecode based on the value of duration passed' do
    @account = FactoryBot.create(:account)
    @metadata = FactoryBot.build(:audio, account_id: @account.id, duration: 60)
    # byebug
    expect(Audio.duration_tc(@metadata.duration)).to eq('00:00:00.60')
  end
end
