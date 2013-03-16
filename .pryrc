#
# Rails Girls Pry Configuration
#  - vjt@openssl.it
#

# Add awesome print for easier array/hash/object printing
#
require 'awesome_print'
Pry.config.print = proc { |output, value|
  begin
    Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output)
  rescue => ex
    Pry.config.exception_handler.call(output, ex, self)
  end
}

# Add Hirb for ActiveRecord pretty printing
#
require 'hirb'
Hirb.enable

old_print = Pry.config.print
Pry.config.print = proc do |output, value|
  Hirb::View.view_or_page_output(value) || old_print.call(output, value)
end

# :heart: prompt :-)
#
Pry.config.prompt_name = if defined?(Rails)
  Rails.application.to_app.class.parent.name
else
  'Ruby'
end
Pry.config.prompt = [
  proc {|target_self, nest_level, pry| # Standard
    "[\033[1m#{pry.input_array.size}\033[0m] \033[1;31m♥ #{Pry.config.prompt_name}\033[1;32m >> \033[0m"
  },
  proc {|target_self, nest_level, pry| # Wait
    "[\033[1m#{pry.input_array.size}\033[0m] \033[1;31m♥ #{Pry.config.prompt_name}\033[1;32m || \033[0m"
  }
]

# Colorize exceptions
#
Pry.config.exception_handler = proc do |output, exception, _|
  output.puts "\n\033[1;32m❢❢❢ \033[1;31m#{exception.class}\033[0m: \033[1m#{exception.message}\033[0m"
  output.puts "\033[1;32m❢❢❢\033[0m  from #{exception.backtrace.first}\n\n"
end

case $0
when 'pry'
  puts "\n\033[1;31m♥ ♥ ♥\033[0;1m Welcome to Ruby #{RUBY_VERSION} \033[1;31m♥ ♥ ♥ \033[1;33m:-)\033[0m\n\n"
when 'script/rails'
  puts "\n\033[1;31m♥ ♥ ♥\033[0;1m Welcome to the #{Rails.application.to_app.class.parent.name} application console \033[1;31m♥ ♥ ♥ \033[1;33m:-)\033[0m\n\n"
end

# vim: ft=ruby
