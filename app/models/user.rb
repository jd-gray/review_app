class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 	has_many :reviews, dependent: :destroy

  ROLES = %w(admin).freeze

  def admin?
    role == 'admin'
  end
end
