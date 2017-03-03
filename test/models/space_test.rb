require 'test_helper'

class SpaceTest < ActiveSupport::TestCase

  setup do
    @space = Space.create :space
    # @now = Time.now
  end

  test 'two spaces exist' do
    FactoryGirl.create :space
    assert_equal 2, Space.all.size
  end

  test 'small space size has small capacity' do
    small = FactoryGirl.create :space, capacity: 25
    assert small.capacity <= 25
  end

end
