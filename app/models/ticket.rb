class Ticket < ApplicationRecord
    has_many :prices
    validates :name, uniqueness: true
end
