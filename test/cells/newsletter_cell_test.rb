require 'test_helper'

class Global::NewsletterCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
