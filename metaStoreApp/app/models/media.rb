class Media < ApplicationRecord
    belongs_to :account
    validates :asset_id, presence: true, uniqueness: true
    #validate :account_id_exists
    validates :media_type, presence: true
    #validates :duration, numericality: { only_integer: true }  
    scope :filter_by_asset_id, -> (asset_id) { where asset_id: asset_id  }
    scope :filter_by_title, -> (title) { where title: title  }
    scope :filter_by_duration, -> (duration) { where duration: 0..(duration.to_i)  }
 
    def account_id_exists
      return false if Account.find_by_id(self.account_id).nil?
    end 
end
