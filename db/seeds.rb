10.times do |index|
  User.create(
    username: "user#{index}",
    name: Faker::Name.unique.name,
    phone_number: Faker::PhoneNumber.unique.cell_phone_in_e164
  )
end

Stock.create(name: 'Stock Deposit 1', code: 'sd01', stock_type: :deposit, balance: 1000)
Stock.create(name: 'Stock Deposit 2', code: 'sd02', stock_type: :deposit, balance: 1000)
Stock.create(name: 'Stock Withdraw 1', code: 'sw01', stock_type: :withdraw, balance: 1000)
