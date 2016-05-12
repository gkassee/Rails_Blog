class Post < ActiveRecord::Base

	has_one :user
	belongs_to :user
	has_many :comments
	
end
