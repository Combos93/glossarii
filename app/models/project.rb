class Project < ApplicationRecord
  has_many :termins, dependent: :destroy

  validates :title, presence: true
end
