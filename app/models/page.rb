class Page < ActiveRecord::Base
  belongs_to :wiki
  validates :wiki, :title, presence: true
end
