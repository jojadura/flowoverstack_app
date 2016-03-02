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

 # validates :title, :presence => {:message => "no puede estar en blanco" }, length: {maximum: 20, :message => "es demasiado largo (20 caracteres maximo)"}
 # validates :body, :presence => {:message => "no puede estar en blanco" }, length: {minimum: 250, :message => "es demasiado corto (250 caracteres mínimo)"}

end
