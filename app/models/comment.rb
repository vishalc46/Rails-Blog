class Comment < ActiveRecord::Base
	validates_presence_of :body, :message => ":Please enter your comment."
	belongs_to :post
end
