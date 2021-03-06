#          Copyright (c) 2009 Michael Fellinger m.fellinger@gmail.com
# All files in this distribution are subject to the terms of the Ruby license.

require 'ramaze/log/logging'
require 'ramaze/log/informer'

begin
  require 'win32console' if RUBY_PLATFORM =~ /win32/i && RUBY_VERSION < '1.9'
rescue LoadError => ex
  puts ex
  puts "For nice colors on windows, please `gem install win32console`"
  Ramaze::Logger::Informer.trait[:colorize] = false
end

module Ramaze
  Log = Innate::Log

  module Logger
    autoload :Analogger, 'ramaze/log/analogger'
    autoload :Knotify,   "ramaze/log/knotify"
    autoload :Syslog,    "ramaze/log/syslog"
    autoload :Growl,     "ramaze/log/growl"
    autoload :Xosd,      "ramaze/log/xosd"
    autoload :Logger,    "ramaze/log/logger"
  end
end
