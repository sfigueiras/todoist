class Task < ApplicationRecord
  belongs_to :list

  def custom_attributes; end
end
