require 'test_helper'

class Global::PagesPreviewCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
