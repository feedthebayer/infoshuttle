class Page < ActiveRecord::Base
  belongs_to :wiki
  validates :wiki, :title, presence: true

  default_scope { order("title ASC") }
end
