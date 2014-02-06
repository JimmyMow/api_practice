class Question < ActiveRecord::Base
  belongs_to :trivium

  acts_as_voteable
end
