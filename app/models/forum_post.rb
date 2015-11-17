class ForumPost < ActiveRecord::Base
	belongs_to :forum_thread
	belongs_to :user
        paginates_per 5
end
