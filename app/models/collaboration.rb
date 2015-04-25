class Collaboration < ActiveRecord::Base
  belongs_to :user
  belongs_to :wiki

  validates :wiki, :user, presence: true
  validates_uniqueness_of :user_id, scope: :wiki_id

  default_scope { order("created_at ASC") }
end
