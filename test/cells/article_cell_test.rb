require 'test_helper'

class ArticleCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
