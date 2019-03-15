require 'test_helper'

class RailsVarToJsHelper::Test < ActiveSupport::TestCase
  include RailsVarToJsHelper

  test "#pass_to_js_tag" do
    expected = 0
    actual   = pass_to_js(0)
    assert_equal expected, actual
  end

  test "#pass_to_js with Integer" do
    expected = 0
    actual   = pass_to_js(0)
    assert_equal expected, actual

    expected = 1
    actual   = pass_to_js(1)
    assert_equal expected, actual

    expected = -1
    actual   = pass_to_js(-1)
    assert_equal expected, actual
  end

  test "#pass_to_js with Float" do
    expected = 0.1
    actual   = pass_to_js(0.1)
    assert_equal expected, actual

    expected = 1.1
    actual   = pass_to_js(1.1)
    assert_equal expected, actual

    expected = -1.1
    actual   = pass_to_js(-1.1)
    assert_equal expected, actual
  end

  test "#pass_to_js with String" do
    expected = '""'
    actual   = pass_to_js("")
    assert_equal expected, actual

    expected = '"hoge"'
    actual   = pass_to_js("hoge")
    assert_equal expected, actual

    expected = '"including double\\" qupte"'
    actual   = pass_to_js("including double\" qupte")
    assert_equal expected, actual
  end

  test "#pass_to_js with Bool" do
    expected = "true"
    actual   = pass_to_js(true)
    assert_equal expected, actual

    expected = "false"
    actual   = pass_to_js(false)
    assert_equal expected, actual
  end

  test "#pass_to_js with NilClass" do
    expected = "null"
    actual   = pass_to_js(nil)
    assert_equal expected, actual
  end

  test "#pass_to_js with Array" do
    expected = "[]"
    actual   = pass_to_js([])
    assert_equal expected, actual

    expected = "[1]"
    actual   = pass_to_js([1])
    assert_equal expected, actual

    expected = "[1,2]"
    actual   = pass_to_js([1, 2])
    assert_equal expected, actual

    expected = '[1,"str"]'
    actual   = pass_to_js([1, "str"])
    assert_equal expected, actual

    expected = '[1,{"k": "v"}]'
    actual   = pass_to_js([1, {k: "v"}])
    assert_equal expected, actual

    expected = '[[]]'
    actual   = pass_to_js([[]])
    assert_equal expected, actual

    expected = '[[1],2]'
    actual   = pass_to_js([[1],2])
    assert_equal expected, actual
  end

  test "#pass_to_js with Hash" do
    expected = "{}"
    actual   = pass_to_js({})
    assert_equal expected, actual

    expected = '{"a": 1}'
    actual   = pass_to_js({a: 1})
    assert_equal expected, actual

    expected = '{"a": "str"}'
    actual   = pass_to_js({a: "str"})
    assert_equal expected, actual

    expected = '{"a:": "str"}'
    actual   = pass_to_js({"a:": "str"})
    assert_equal expected, actual

    expected = '{"a": "str","b": 0,"c": [],"d": [1,2,3]}'
    actual   = pass_to_js({a: "str", b: 0, c: [], d: [1,2,3]})
    assert_equal expected, actual
  end

  test "#pass_to_js with Time/Date/DateTime/TimeWithZone" do
    expected = "new Date(\"2019-03-15 03:23:38 +0900\")"
    actual   = pass_to_js(Time.parse("2019-03-15 03:23:38 +0900"))
    assert_equal expected, actual
  end

end
