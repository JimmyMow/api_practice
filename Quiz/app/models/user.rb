class User < ActiveRecord::Base
  acts_as_voter
  has_karma :questions, :as => :submitter, :weight => [ 1, .5 ]
end
