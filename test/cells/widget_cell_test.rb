require 'test_helper'

class WidgetCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
