class Review < ApplicationRecord
  validates :content, presence: true
  validates :rating, presence: true,
                     numericality: { only_integer: true },
                     inclusion: { in: (0..5) }
  validates :cocktail, presence: true
  belongs_to :cocktail
end
