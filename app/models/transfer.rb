class Transfer < ApplicationRecord
  has_many   :transactions, as: :fund, dependent: :destroy
  belongs_to :from, class_name: 'Account'
  belongs_to :to, class_name: 'Account'

  validates :amount, presence: true

  def create_transactions
    code = Faker::Code.npi
    transactions.build(subject: :receiver, code:, transactable: to)
    transactions.build(subject: :sender, code:, transactable: from)
  end
end
