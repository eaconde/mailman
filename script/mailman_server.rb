
#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rubygems'
require 'bundler/setup'
require 'mailman'
require 'email'

Mailman.config.ignore_stdin = true
Mailman.config.logger = Logger.new File.join(__dir__, '../log/mailman.log')
Mailman.config.poll_interval = 5
Mailman.config.pop3 = {
    server: 'pop.gmail.com',
    port: 995,
    ssl: true,
    username: ENV['GMAIL_USERNAME'],
    password: ENV['GMAIL_PASSWORD'],
}

Mailman::Application.run do
  default do
    begin
      Email.process message
    rescue Exception => e
      Mailman.logger.error "An exception occured while processing the message:\n#{message}"
      Mailman.logger.error [e, *e.backtrace].join("\n")
    end
  end
end
