class Transfer < ApplicationRecord
  has_many   :transactions, as: :fund, dependent: :destroy
  belongs_to :from, class_name: 'Account'
  belongs_to :to, class_name: 'Account'

  validates :amount, presence: true
end
