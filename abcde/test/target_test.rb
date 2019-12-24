require 'test/unit'
require 'target'

class TargetTest < Test::Unit::TestCase
  def setup
  end

  def test_a
    t = Target.new
    assert 'a', t.a
  end
end