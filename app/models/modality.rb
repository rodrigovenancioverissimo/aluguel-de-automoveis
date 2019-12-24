class Modality < ApplicationRecord
  belongs_to :license

  enum name: { 'ACC': 0, 'A': 1, 'B': 2, 'C': 3, 'D': 4, 'E': 5 }

  validates :license, presence: true
  validates :name, presence: true, uniqueness: { scope: :license, message: 'categoria já cadastrada' }
end
