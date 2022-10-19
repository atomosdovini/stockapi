class Ticket < ApplicationRecord
    validates :name, uniqueness: true
end
