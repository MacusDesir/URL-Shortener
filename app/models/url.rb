class Url < ApplicationRecord
validates :long, :short, uniqueness: true
before_validation :shorten, on: :create

	def shorten
		self.short = ('a'..'z').to_a.shuffle[0,2].join << SecureRandom.hex(1)
	end
end
