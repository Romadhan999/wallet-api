class Transaction < ApplicationRecord
  extend Enumerize

  belongs_to :fund, polymorphic: true
  belongs_to :transactable, polymorphic: true

  after_create :update_balance

  enumerize :subject, in: %i[sender receiver]

  def update_balance
    case subject
    when 'sender'
      transactable.update(balance: transactable.balance - fund.amount)
    when 'receiver'
      transactable.update(balance: transactable.balance + fund.amount)
    else
      'Transaction error'
    end
  end
end
