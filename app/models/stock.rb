class Stock < ApplicationRecord
  extend Enumerize
  has_many :transactions, as: :transactable

  validates :code, presence: true, uniqueness: true

  enumerize :stock_type, in: %i[deposit withdraw], scope: true
end
