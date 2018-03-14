# encoding: utf-8
require 'test_helper'

class SluggedHistoryTest < MiniTest::Test

  def setup
    I18n.locale = :en
  end

  def after
    Text.delete_all
  end

  test "should save initial slug in history table" do
    transaction do
      text = Text.create(title: "dummy text")

      assert_equal text.slugs.count, 1
      assert_equal text.friendly_id, 'dummy-text'
    end
  end

  test "should find text with old slug" do
    transaction do
      text = Text.create(title: "dummy text")
      text.title = "new title"
      text.save

      assert_equal text.slugs.count, 2
      assert_equal text.friendly_id, 'new-title'

      found_text = Text.friendly.find('dummy-text')
      refute_nil found_text
    end
  end
end
