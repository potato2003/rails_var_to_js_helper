# frozen_string_literal: true
require "rails_var_to_js_helper/railtie"

module RailsVarToJsHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::JavaScriptHelper

  def pass_to_js_tag(vars = {})
    result = +""
    vars.each do |(k, v)|
      result << "window.#{k} = #{pass_to_js(v)};\n"
    end

    content_tag(:script, result, {}, false)
  end

  def pass_to_js(v)
    case v
    when String, Symbol
      "\"#{ escape_javascript(v.to_s) }\""
    when Numeric
      v
    when Array
      js_val = v.inject([]) do |result, array_v|
        result << pass_to_js(array_v)
      end
      "[#{js_val.join(',')}]"
    when Hash
      js_val = v.inject([]) do |result, (hash_k, hash_v)|
        result << "#{pass_to_js(hash_k)}: #{pass_to_js(hash_v)}"
      end
      "{#{js_val.join(',')}}"
    when TrueClass, FalseClass
      v.to_s
    when Time, Date, DateTime
      "new Date(#{pass_to_js(v.to_s)})"
    when nil
      js_val = "null"
    else
      raise "unsupport type: #{v.class}"
    end
  end
end
