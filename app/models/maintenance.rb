class Maintenance < ApplicationRecord
  belongs_to :device
  belongs_to :maintainer
end
