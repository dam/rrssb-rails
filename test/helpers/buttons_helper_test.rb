require 'test_helper'

class Rrssb::Rails::ButtonsHelperTest < ActionView::TestCase
  test "#rrssb_tag accepts url and buttons options" do 
    identifier_url = 'http://myurl.com'
    result = rrssb_tag(url: identifier_url, buttons: %w{facebook twitter}) 
    doc = HTML::Document.new(result)

    assert_select doc.root, "ul.rrssb-buttons"
    assert_select doc.root, "li", 2
    assert_select doc.root, "a.popup", 2 do
      assert_select "[href=?]", /.*url=#{identifier_url}.*/  # Href property for the 2 includes the given url
    end
  end

  test "#rrssb_tag generates a github button than opens a link specified by its url, no popup" do
    url_to_open = 'https://github.com/dam/rrssb-rails'
    result = rrssb_tag(url: url_to_open, buttons: ['github']) 
    doc = HTML::Document.new(result)

    assert_select doc.root, "li.rrssb-github"
    assert_select doc.root, "a", 1 do
      assert_select "[href=?]", /.*#{url_to_open}.*/ 
    end
  end

  test "#rrssb_tag generates a delicious button" do 
  	identifier_url = 'http://myurl.com'
  	title = 'My sharing title'
    result = rrssb_tag(url: identifier_url, title: title, buttons: ['delicious']) 
    doc = HTML::Document.new(result)

    assert_select doc.root, "li.rrssb-delicious"
    assert_select doc.root, "a", 1 do
      assert_select "[href=?]", /.*url=#{identifier_url}.*/ 
      assert_select "[href=?]", /.*title=#{title}.*/ 
    end
  end

  test "#rrssb_tag generates a google+ button with special content" do 
    identifier_url = 'http://myurl.com'
    result = rrssb_tag(url: identifier_url, buttons: ['google_plus']) 
    doc = HTML::Document.new(result)

    assert_select doc.root, "li.rrssb-googleplus"
    assert_select doc.root, "a", 1 do
      assert_select "[href=?]", /.*url=#{identifier_url}.*/ 
    end
  end

  test "#rrssb_tag generates a harcker news button to submit a link" do 
    url_to_link = 'http://myurl.com'
    title = 'My title'
    result = rrssb_tag(url: url_to_link, title: title, buttons: ['hackernews']) 
    doc = HTML::Document.new(result)

    assert_select doc.root, "li.rrssb-hackernews"
    assert_select doc.root, "a", 1 do
      assert_select "[href=?]", /.*u=#{url_to_link}.*/ 
      assert_select "[href=?]", /.*t=#{title}.*/ 
    end
  end

  test "#rrssb_tag generates a piterest sharing button" do
    url_to_link = 'http://myurl.com'
    title = 'My title'
    img_url = image_url('rrssb-rails-404.png')

    result = rrssb_tag(url: url_to_link, title: title, buttons: ['pinterest'], contents: { pinterest: { img: img_url } } ) 
    doc = HTML::Document.new(result)
    
    assert_select doc.root, "li.rrssb-pinterest"
    assert_select doc.root, "a", 1 do
      assert_select "[href=?]", /.*url=#{url_to_link}.*/
      assert_select "[href=?]", /.*description=#{title}.*/ 
      assert_select "[href=?]", /.*media=.*#{img_url}.*/
    end
  end
end