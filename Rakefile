dir = File.expand_path(__dir__)
$LOAD_PATH.unshift(File.join(dir, 'lib'))
ENV['BUNDLE_GEMFILE'] ||= File.join(dir, 'Gemfile')

require 'bundler/setup'
require 'shooby_do_bop'

[:crawl].each do |action|
  desc "alias of shooby:#{action}"
  task action => "shooby:#{action}"
end

Dir.glob(File.join(ShoobyDoBop::Environment.dir, 'lib/task/*.rb')).sort.each do |f|
  require f
end
