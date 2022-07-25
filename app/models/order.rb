class Order < ApplicationRecord
  before_validation :set_total!

  validates :total, numericality: { greater_than_or_equal_to: 0}
  validates :total, presence: true

  belongs_to :user
  has_many :placements, dependent: :destroy
  has_many :products, through: :placements

  def set_total!
    self.total=products.sum :price
  end


end
