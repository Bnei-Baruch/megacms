require 'test_helper'

class Global::IframeCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
