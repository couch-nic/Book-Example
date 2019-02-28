class Book < ApplicationRecord
  validates :title, :plot, presence: true
end
