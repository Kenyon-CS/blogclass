class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :keywords
  #has_many :keywords
  #belongs_to :keywords, optional: true
  
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  
end 