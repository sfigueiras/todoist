class Task < ApplicationRecord
  belongs_to :list

  def self.descendant_types
  	self.descendants.map do |d|
  		select_options(d)
  	end
  end

  def self.default_option
  	"SimpleTask"
  end

  private 

  def self.select_options(descendant)
  	["#{descendant.name.split('Task').first} Task", descendant.name]
  end
end
