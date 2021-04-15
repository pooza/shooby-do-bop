require 'pp'

desc 'test all'
task :test do
  ShoobyDoBop::TestCase.load
end
