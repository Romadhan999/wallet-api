module Api
  class TransactionsController < ApplicationController
    def deposit
      code = Faker::Code.npi
      deposit = Deposit.new(deposit_params)
      deposit.transactions.build(subject: :receiver, code:, transactable: deposit.to)
      deposit.transactions.build(subject: :sender, code:, transactable: deposit.from)
      if (deposit.from.balance >= deposit.amount) && deposit.save
        render json: deposit.as_json
      else
        render json: { message: 'Deposit Fail', success: false }
      end
    end

    def withdraw
      code = Faker::Code.npi
      withdraw = Withdraw.new(withdraw_params)
      withdraw.transactions.build(subject: :receiver, code:, transactable: withdraw.to)
      withdraw.transactions.build(subject: :sender, code:, transactable: withdraw.from)
      if (withdraw.from.balance >= withdraw.amount) && withdraw.save
        render json: withdraw.as_json
      else
        render json: { message: 'Withdraw Fail', success: false }
      end
    end

    def transfer
      code = Faker::Code.npi
      account_receiver = Account.find_by(number: params[:transfer][:to_id])
      params[:transfer][:to_id] = account_receiver.id
      transfer = Transfer.new(transfer_params)
      transfer.transactions.build(subject: :receiver, code:, transactable: transfer.to)
      transfer.transactions.build(subject: :sender, code:, transactable: transfer.from)
      if (transfer.from.balance >= transfer.amount) && transfer.save
        render json: transfer.as_json
      else
        render json: { message: 'Transfer Fail', success: false }
      end
    end

    def deposit_params
      params.require(:deposit).permit(:amount, :from_id, :to_id)
    end

    def withdraw_params
      params.require(:withdraw).permit(:amount, :from_id, :to_id, :receiver_number)
    end

    def transfer_params
      params.require(:transfer).permit(:amount, :from_id, :to_id)
    end
  end
end
