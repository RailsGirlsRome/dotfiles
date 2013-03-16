#
# Rails Girls Application template
#  - vjt@openssl.it
#

# Add pry-rails and debugger gems
gem 'pry-rails'
gem 'pry-doc'
gem 'pry-debugger'
gem 'debugger'
gem 'hirb'
gem 'awesome_print'

# Spice up the READMEs
%w[ README.rdoc doc/README_FOR_APP ].each do |f|
  prepend_to_file f, <<HEART

                   ***     ***
                 **   ** **   **
                *       *       *
                *               *
                 *             *
                  **         **
                    **     **
                      ** **
                        *
     ____       _ _        ____ _      _
    |  _ \\ __ _(_) |___   / ___(_)_ __| |___
    | |_) / _` | | / __| | |  _| | '__| / __|
    |  _ < (_| | | \\__ \\ | |_| | | |  | \\__ \\
    |_| \\_\\__,_|_|_|___/  \\____|_|_|  |_|___/

---------------------------------------------
HEART

end

# Git ignores
append_to_file '.gitignore', <<IGNORE
# Ignore vim and MacOS' finder tmp files
.*.sw?
.DS_Store

IGNORE

# Init git repo
git :init
git :add => '.'
git :commit => '-am "♥ Initial commit ♥"'

# Greet
puts
puts <<HEART
\033[1;31m
               ***     ***
             **   ** **   **
            *       *       *
            *               *
             *             *
              **         **
                **     **
                  ** **
                    *
\033[0m
HEART

puts "Your application \033[1m#{app_name}\033[0m has been created! :-)"
puts
puts "Enter the application folder by typing"
puts
puts "  \033[1mcd #{app_path}\033[0m"
puts
puts "and let's get started! :-)"
puts

# vim: ft=ruby
