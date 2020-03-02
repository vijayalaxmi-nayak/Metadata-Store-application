require 'rails_helper'

RSpec.describe Media, type: :model do
  before(:context) do
    @account = FactoryBot.create(:account)
    byebug
  end
  
  after(:context) do
    @account.destroy
    byebug
  end

  context "validation test" do
=begin
    it "should not create a media record on validation failure of duration not being integer" do
      metadata = FactoryBot.build(:media, :account_id => @account.id, :duration => "xyz")
      expect { metadata.save }.to raise_error
      byebug
    end
=end

    it "should create a media record on validation success" do
      metadata = FactoryBot.build(:media, :account_id => @account.id)
      status = metadata.save
      byebug
      expect(status).to eq(true)
    end
  end
end
