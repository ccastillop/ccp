class Contact < ActiveRecord::Base
  validates :message, :email, presence: true
  validates :email, :email => true
end
