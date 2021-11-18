class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true
  belongs_to :facility
  belongs_to :maintainer
end
