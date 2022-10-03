require "test_helper"

class CategoryTest < ActiveSupport::TestCase

  test 'should not save category without name' do
    category = Category.new
    assert_not category.save
  end

  test 'category name should be unique' do
    category = Category.new
    category.category_name = "existing category"
    assert_not category.save
  end

end
