class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender=sender
    @receiver=receiver
    @amount=amount
    @status="pending"
  end
  
  def valid?
    @sender.valid? && @receiver.valid?
  end
  
  def execute_transaction
    if self.valid? && @status=="pending"
      @status="complete"
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
    else
      "Transaction rejected. Please check your account balance."
    end
  end
end
