#!/usr/bin/env ruby

require 'daemons'

Daemons.run 'script/mailman_server.rb',
  dir: File.join(__dir__, 'tmp/pids'),
  dir_mode: :normal
