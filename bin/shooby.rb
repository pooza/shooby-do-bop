#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.join(File.expand_path('..', __dir__), 'app/lib'))

require 'shooby_do_bop'
module ShoobyDoBop
  options = ARGV.getopts('', 'entry:')
  raise 'crawler entry undefined.' unless name = options['entry']
  unless crawler = ShoobyDoBop::Crawler.create(name)
    raise "crawler '#{name}' undefined."
  end
  crawler.exec
rescue => e
  warn e.message
  exit 1
end
