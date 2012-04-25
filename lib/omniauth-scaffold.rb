module Omniauth
  module Rails
    require 'omniauth/rails/engine' if defined?(Rails)
  end
end

require 'omniauth/rails/scaffold' if defined?(Rails)
