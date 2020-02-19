namespace :shooby do
  desc 'crawl'
  task :crawl do
    sh File.join(ShoobyDoBop::Environment.dir, 'bin/crawl.rb')
  end
end

[:crawl].each do |action|
  desc "alias of shooby:#{action}"
  task action => "shooby:#{action}"
end
