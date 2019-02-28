dir = File.expand_path(__dir__)
$LOAD_PATH.unshift(File.join(dir, 'lib'))
ENV['BUNDLE_GEMFILE'] ||= File.join(dir, 'Gemfile')
ENV['SSL_CERT_FILE'] ||= File.join(dir, 'cert/cacert.pem')
ENV['RAKE_MODULE'] = 'ShoobyDoBop'

require 'bundler/setup'
require 'shooby_do_bop'

desc 'test all'
task test: ['shooby:test']

[:crawl].each do |action|
  desc "alias of shooby:#{action}"
  task action => "shooby:#{action}"
end

['Ginseng', ENV['RAKE_MODULE']].each do |prefix|
  Dir.glob(File.join("#{prefix}::Environment".constantize.dir, 'lib/task/*.rb')).each do |f|
    require f
  end
end
