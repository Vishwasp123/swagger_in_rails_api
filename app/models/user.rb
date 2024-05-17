class User < ApplicationRecord
	validates :name, :address, :age, presence: true
	def self.ransackable_attributes(auth_object = nil)
		["address", "age", "created_at", "id", "id_value", "name", "updated_at"]
	end

end
