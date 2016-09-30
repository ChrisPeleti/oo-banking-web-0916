class Transfer
  attr_accessor :sender,:receiver,:amount,:status
  def initialize(sender,receiver,amount)
    @sender=sender
    @receiver=receiver
    @amount=amount
    @status="pending"
  end

  def valid?
    if sender.valid? == true && receiver.valid? == true
      return true
    else
      return false
    end

  end

  def execute_transaction
    if sender.balance - amount < 0
      @status="rejected"
      return "Transaction rejected. Please check your account balance."
    elsif valid? && status=="pending"
      @sender.balance-=@amount
      @receiver.balance+=@amount
      @status="complete"
    end
  end

  def reverse_transfer
    if @status=="complete"
    @sender.balance+=@amount
    @receiver.balance-=@amount
     @status="reversed"
   end
  end






end
