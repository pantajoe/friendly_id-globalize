class Module
  def test(name, &block)
    define_method("test_#{name.gsub(/[^a-z0-9']/i, "_")}".to_sym, &block)
  end
end
