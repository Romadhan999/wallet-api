class User < ApplicationRecord
  has_one :account

  validates :username, presence: true, uniqueness: true
  validates :name, presence: true
  validates :phone_number, presence: true

  before_create :add_account

  def add_account
    build_account(number: Faker::Number.unique.leading_zero_number(digits: 10))
  end
end
