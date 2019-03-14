module RailsVarToJsHelper
  class Railtie < ::Rails::Railtie
    initializer 'rails_var_to_js.helper' do |_app|
      ActionView::Base.send :include, RailsVarToJsHelper
    end
  end
end
