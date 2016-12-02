class List < ApplicationRecord
	extend FriendlyId
	friendly_id :name, use: :slugged

	has_many :tasks
end
