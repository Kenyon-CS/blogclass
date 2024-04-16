class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :keywords

  
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  
end 