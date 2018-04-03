require 'test_helper'

class SecureUuidTest < MiniTest::Test
  def setup
    @user = User.new
  end

  def test_uuid_values_are_generated_for_specified_attributes_and_persisted_on_save
    @user.save
    refute_nil @user.identifier
    refute_nil @user.uuid
  end

  def test_regenerating_the_secure_uuid
    @user.save
    old_identifier = @user.identifier
    old_uuid = @user.uuid
    @user.regenerate_identifier
    @user.regenerate_uuid

    refute_equal @user.identifier, old_identifier
    refute_equal @user.uuid, old_uuid
  end

  def test_uuid_value_not_overwritten_when_present
    @user.identifier = '6c3d256c-aaa7-443a-a16b-75a99ecde277'
    @user.save

    assert_equal @user.identifier, '6c3d256c-aaa7-443a-a16b-75a99ecde277'
  end
end
