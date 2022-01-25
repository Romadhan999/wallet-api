class Withdraw < ApplicationRecord
  has_many   :transactions, as: :fund, dependent: :destroy
  belongs_to :from, class_name: 'Account'
  belongs_to :to, class_name: 'Stock'

  validates :amount, presence: true
  validates :receiver_number, presence: true
end
