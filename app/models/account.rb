class Account < ApplicationRecord
  has_many :transactions, as: :transactable
end
