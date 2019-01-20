dir = File.expand_path(__dir__)
$LOAD_PATH.unshift(File.join(dir, 'lib'))
ENV['BUNDLE_GEMFILE'] ||= File.join(dir, 'Gemfile')
ENV['SSL_CERT_FILE'] ||= File.join(dir, 'cert/cacert.pem')

require 'bundler/setup'
require 'shooby_do_bop'

desc 'test'
task :test do
  require 'test/unit'
  Dir.glob(File.join(ShoobyDoBop::Environment.dir, 'test/*')).each do |t|
    require t
  end
end

desc 'run'
task :run do
  sh './loader.rb'
end

namespace :cert do
  desc 'update cert'
  task :update do
    require 'httparty'
    File.write(
      File.join(ShoobyDoBop::Environment.dir, 'cert/cacert.pem'),
      HTTParty.get('https://curl.haxx.se/ca/cacert.pem'),
    )
  end
end
