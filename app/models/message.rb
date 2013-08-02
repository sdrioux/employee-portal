class Message < ActiveRecord::Base
  attr_accessible :body

  belongs_to :recipient, class_name: 'User', foreign_key: 'recipient_id'
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'

  scope :unread, -> { where(read: false) }

  # Deliver this message from sender to recipient.
  #
  # sender    - The User sending the message.
  # recipient - The User receiving the message.
  #
  # Returns the delivered Message.
  def deliver!(sender: nil, recipient: nil)
    raise ArgumentError, "both sender and recipient must be specified" unless sender && recipient
  end
end
