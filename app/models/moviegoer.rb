class Moviegoer < ActiveRecord::Base
	has_many :reviews
	has_many :movies, :through => :review
end
