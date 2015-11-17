class ForumThread < ActiveRecord::Base
	belongs_to :user
	has_many :forum_posts

	accepts_nested_attributes_for :forum_posts
	validates :subject, presence: true
	validates_associated :forum_posts
end
