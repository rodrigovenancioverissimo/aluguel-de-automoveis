class Lease < ApplicationRecord
  belongs_to :person
  belongs_to :automobile
end
