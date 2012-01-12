require 'test_helper'

class Global::TitleCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
