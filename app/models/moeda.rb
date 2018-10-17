class Moeda < ApplicationRecord
    belongs_to :mining_type, optional:true
end
