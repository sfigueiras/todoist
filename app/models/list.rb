class List < ApplicationRecord
	extend FriendlyId
	friendly_id :name, use: :slugged

	validates :name, presence: true

	has_many :tasks

	def ordered_tasks
    		self.tasks.order(:priority)
  	end
end
