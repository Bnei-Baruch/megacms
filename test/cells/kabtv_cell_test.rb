require 'test_helper'

class Global::KabtvCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
