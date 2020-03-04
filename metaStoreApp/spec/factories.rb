# frozen_string_literal: true
FactoryBot.define do
  factory :account do
    code { 'test' }
    name { 'test' }
    password { 'test' }
  end

  factory :media do
    asset_id { 'AZ100' }
    media_type { 'audio' }
    account_id { '1' }
    title { 'audio1' }
    duration { 12060 }
    location { 'location1' }
    recorded_time { '01/02/20 01:02:54' }
  end
end
