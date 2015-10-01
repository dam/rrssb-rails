require 'test_helper'

class Rrssb::Rails::ButtonsHelperTest < ActionView::TestCase
  test "#rrssb_tag accepts url and buttons options" do 
    identifier_url = 'http://myurl.com'
    result = rrssb_tag(url: identifier_url, buttons: %w{facebook twitter}) 
    doc = HTML::Document.new(result)

    assert_select doc.root, "ul.rrssb-buttons"
    assert_select doc.root, "li", 2
    assert_select doc.root, "a.popup", 2 do
      assert_select "[href=?]", /.*#{identifier_url}.*/  # Href property for the 2 includes the given url
    end
  end
end