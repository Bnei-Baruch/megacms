require 'test_helper'

class Global::RssCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
