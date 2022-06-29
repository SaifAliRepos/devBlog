# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :likecs, dependent: :destroy
  has_many :suggestions, dependent: :destroy

  scope :admin_user, -> { where(role: 'admin') }
  scope :moderator_user, -> { where(role: 'moderator') }
  scope :user_user, -> { where(role: 'user') }

  enum role:
  {
    admin: 'admin',
    moderator: 'moderator',
    user: 'user'
  }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable


end
