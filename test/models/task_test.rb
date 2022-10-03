require "test_helper"

class TaskTest < ActiveSupport::TestCase
  
  test 'task cant be blank' do
    task = Task.new
    assert_not task.save
  end
end
