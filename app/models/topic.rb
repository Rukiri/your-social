class Topic < ActiveRecord::Base
	belongs_to :forum
	has many :posts, :dependent => :destroy 
end
