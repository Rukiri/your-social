class Category < ActiveRecord::Base
	has_many :forums, :dependent => :destroy 
end
