class Artist < ApplicationRecord
    has_many :songs, dependent: :destroy

    validates :name, length: { minimum: 1}, uniqueness: true
end
