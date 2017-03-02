class Review < ApplicationRecord
  validates_presence_of :content, :accuracy, :communication, :location, :facilities
  # validates_inclusion_of :age, :in => 0..

  belongs_to :user
  belongs_to :space
  # belongs_to :booking
  
end
