class Wiki < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  has_many :pages, inverse_of: :wiki, dependent: :destroy

  validates :name, presence: true
  validates :public, inclusion: { in: [true, false] }
  validates_associated :pages

  default_scope { order("name ASC") }
end
