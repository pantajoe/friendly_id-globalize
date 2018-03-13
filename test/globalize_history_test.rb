# encoding: utf-8
require 'test_helper'

class GlobalizeHistoryTest < MiniTest::Test
  def setup
    I18n.locale = :en
  end

  def after
    Dummy.delete_all
  end

  test "should save initial slugs in history table" do
    transaction do
      dummy = Dummy.create(title: "dummy title")
      ::I18n.with_locale(:de) { dummy.title = 'deutscher titel'; dummy.save }

      assert_equal dummy.slugs.count, 2
      assert_equal(::I18n.with_locale(:de) { dummy.friendly_id }, 'deutscher-titel')
    end
  end

  test "should find dummy with old slug" do
    transaction do
      dummy = Dummy.create(title: "dummy title")
      ::I18n.with_locale(:de) { dummy.title = 'deutscher titel'; dummy.save }
      ::I18n.with_locale(:de) { dummy.title = "neuer deutcher titel"; dummy.save }

      de_slug = ::I18n.with_locale(:de) { dummy.friendly_id }
      assert_equal dummy.slugs.count, 3
      assert_equal de_slug, 'neuer-deutcher-titel'

      found_dummy = :I18n.with_locale(:de) { Dummy.friendly.find('deutscher-titel') }
      refute_nil found_dummy
    end
  end
end
