require 'test_helper'

class Global::BlockCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
