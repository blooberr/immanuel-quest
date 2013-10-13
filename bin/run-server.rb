#!/usr/bin/env ruby
require 'trollop'
require 'daemons'

opts = Trollop::options do
  opt :daemonize, "daemonizes the program. Pass in --run to run in foreground or --start to run in background", :default => false
end

daemon_options = {
  :log_output  => false,
  :backtrace   => true,
  :monitor     => true,
  :multiple    => false,
  :log_dir     => '/tmp',
  :dir         => '/tmp',
  :hard_exit   => true,
  :ontop       => !opts[:daemonize],
  :mode        => :exec
} 

Daemons.run_proc("immanuel-quest-server", daemon_options) do
  # World::setup
  loop do
    puts "executing main world loop."
    sleep 1
  end
end

