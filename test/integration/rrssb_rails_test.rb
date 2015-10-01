require 'test_helper'

class RrssbRailsTest < ActionDispatch::IntegrationTest
  teardown { clean_sprockets_cache }

  test "engine is loaded" do
    assert_equal ::Rails::Engine, Rrssb::Rails::Engine.superclass
  end

  test "stylesheets are served" do 
    get '/assets/rrssb.css'
    assert_response :success
    assert_match(/.rrssb-buttons/, response.body)
  end

  test "stylesheet is available in a sprocket require" do
    get '/assets/sprockets-require.css'
    assert_response :success
    assert_match(/.rrssb-buttons/, response.body)
  end

  test "javascripts are served" do 
    get '/assets/rrssb.js'
    assert_response :success
    assert_match(/\$.fn.rrssb/, response.body)
  end

  test "helpers are available in the view" do 
    get '/buttons'
    assert_response :success
    assert_select "ul.rrssb-buttons"
    assert_select "li.rrssb-facebook"
    assert_select "li.rrssb-twitter"
    assert_select "li.rrssb-googleplus"
  end

  private

  def clean_sprockets_cache
    FileUtils.rm_rf File.expand_path("../dummy/tmp",  __FILE__)
  end
end