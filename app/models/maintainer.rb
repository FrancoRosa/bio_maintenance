class Maintainer < ApplicationRecord
  has_many :maintenances

  validates :name, presence: true
  validates :phone, presence: true
  validates :dni, presence: true, length: { is: 8 }
end
