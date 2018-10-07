class Company < ApplicationRecord
	has_many :houses
	validates :Name,     presence: true, length: { maximum: 255 },
			     uniqueness: true
	validates :Website,  presence: true, length: { maximum: 255 },
			     uniqueness: { case_sensitive: false }
	validates :Address,  presence: true, length: { maximum: 255 }
	validates :Size,     presence: true, length: { maximum: 50 }
	validates :Founded,  presence: true, length: { maximum: 6 }
	validates :Revenue,  presence: true, length: { maximum: 50 }
	# validates for synopsis is not decided yet
end