require 'test_helper'

class ListTest < ActiveSupport::TestCase
  test "it doesn't create if name not present" do
  	list = List.new

  	assert_not list.save
  end

  test "it doesnt create to lists with the same slug" do
  	list_one = List.create name: 'mi lista'
  	list_two = List.create name: 'mi-lista'

  	refute_equal list_one.slug, list_two.slug
  end
end
