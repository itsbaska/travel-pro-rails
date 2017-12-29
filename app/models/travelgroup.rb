class Travelgroup < ApplicationRecord
  belongs_to :trip
  has_many :flights
  belongs_to :traveller, class_name: "User"
end
