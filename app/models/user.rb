
class User < ApplicationRecord

    has_secure_password

  has_many :gossips
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :join_table_user_private_messages
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage", through: :join_table_user_private_messages
  validates :first_name, presence: true
  validates :last_name, presence: true
  belongs_to :city
  validates :age, presence: true
  validates :city, presence: true
  validates :password, length: { minimum: 6 }, on: :create
  validates :email, presence: true, uniqueness: true

  end
