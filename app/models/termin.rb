class Termin < ApplicationRecord
  belongs_to :project

  validates :name, presence: true, uniqueness: true
  validates :translation, presence: true
end
