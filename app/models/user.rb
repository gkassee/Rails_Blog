class User < ActiveRecord::Base

	has_many :posts
	has_many :comments
	belongs_to :post
	
	scope :frequent_poster, -> { @users = User.all
		freqs = []
		@users.each do |user|
			if user.posts.count > 3
				freqs << user
			end
		end
		freqs
	 }

end
