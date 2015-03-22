class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :pages, inverse_of: :wiki, dependent: :destroy
  validates :name, presence: true
  validates :public, inclusion: { in: [true, false] }
  validates_associated :pages
end
