require 'test/unit'
require 'extensions/array'

class TC_Array < Test::Unit::TestCase
  def setup
    n = 100
    @a1 = (1..n).map{ rand(n) }
    @a2 = (1..n).map{ rand(n) }
    @expected_intersection = @a1 & @a2
  end
  
  def test_array_intersects_with_select
    assert_equal(@expected_intersection.sort, @a1.intersects_with_select(@a2).sort)
  end
  
  def test_array_intersects_with_collect
    assert_equal(@expected_intersection.sort, @a1.intersects_with_collect(@a2).sort)
  end
  
  def test_array_intersects_with_while
    assert_equal(@expected_intersection.sort, @a1.intersects_with_while(@a2).sort)
  end
  
  def test_array_intersects_with_for
    assert_equal(@expected_intersection.sort, @a1.intersects_with_for(@a2).sort)
  end
end