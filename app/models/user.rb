class User < ApplicationRecord
  authenticates_with_sorcery!

  has_one :seller
  has_one :buyer

  validates_length_of :first_name, minimum: 2, maximum: 30, allow_blank: false
  validates_length_of :last_name, minimum: 2, maximum: 30, allow_blank: false
  validates_length_of :location, minumum: 2, maximum: 30, allow_blank: false
  validates_length_of :password, minimum: 8, allow_blank: false, if: :password

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }

  public

  def self.admin?
    admin
  end

  def seller?
    seller
  end

  def buyer?
    buyer
  end

  private

end
