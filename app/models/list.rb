class List < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true

  has_many :tasks

  def ordered_tasks
    valid_tasks
  end

  def valid_tasks
    tasks.where("end_date is null or end_date >= :current_date", { current_date: Date.current }).order(:priority)
  end

  def expired_tasks
    tasks.where("end_date is not null and end_date < :current_date", { current_date: Date.current})
  end
end
