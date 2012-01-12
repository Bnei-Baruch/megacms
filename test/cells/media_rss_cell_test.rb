require 'test_helper'

class Global::MediaRssCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
