class Task < ApplicationRecord
  belongs_to :list, touch: true

  def self.descendant_types
  	%W(SimpleTask LongTask TemporaryTask).map do |d|
  		select_options(d)
  	end
  end

  def self.default_option
  	"SimpleTask"
  end

  private 

  def self.select_options(descendant)
  	["#{descendant.split('Task').first} Task", descendant]
  end
end
