class Collaboration < ActiveRecord::Base
  belongs_to :user
  belongs_to :wiki

  validates :wiki, :user, presence: true

  default_scope { order("created_at ASC") }
end
