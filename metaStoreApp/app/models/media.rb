class Media < ApplicationRecord
    belongs_to :account
    validates :asset_id, presence: true, uniqueness: true
    validate :account_id_exists
    validates :media_type, presence: true
  
    def account_id_exists
      return false if Account.find_by_id(self.account_id).nil?
    end 
end
