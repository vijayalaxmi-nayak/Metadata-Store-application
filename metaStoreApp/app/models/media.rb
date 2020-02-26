class Media < ApplicationRecord
    belongs_to :account
    has_one :metadata, dependent: :destroy
    
    validates :asset_id, presence:true,uniqueness:true
    validate :account_id_exists

    def account_id_exists
        return false if Account.find_by_id(self.account_id).nil?
    end 
end
