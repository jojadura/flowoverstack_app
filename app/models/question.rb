# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :answers
  has_many :votes, as: :voteable
  #has_many :comments, as: :commentable

  validates :title, :presence => {:message => "no puede estar en blanco" }
  validates :body, :presence => {:message => "no puede estar en blanco" }

 
 
  def self.search(query)
    where("title like ?", "%#{query}%") 
  end  



end
