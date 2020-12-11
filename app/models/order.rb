class Order < ApplicationRecord
    has_many :cartitems
    belongs_to :user
end
