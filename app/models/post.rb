class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :cities


  validates :title, length: { maximum: 200 }, presence: true
  validates :story, length: { maximum: 300}, presence: true
end
