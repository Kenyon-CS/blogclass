class Keyword < ApplicationRecord
	has_and_belongs_to_many :articles
	#has_many :articles
	#belongs_to :articles, optional: true
end
