class User < ActiveRecord::Base
include Gravtastic
gravtastic
acts_as_paranoid

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable

  validates :email, presence: true

  has_many :forum_threads
  has_many :forum_posts 

  attr_accessor :login
end
