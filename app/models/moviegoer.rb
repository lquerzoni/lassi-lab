class Moviegoer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :reviews
	has_many :movies, :through => :reviews
  acts_as_user roles: [:moviegoer]
end
