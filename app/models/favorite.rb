class Favorite < ApplicationRecord
  belongs_to :owner
  belongs_to :cause
end
