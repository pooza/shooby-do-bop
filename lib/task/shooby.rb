namespace :shooby do
  desc 'crawl'
  task :crawl do
    sh File.join(ShoobyDoBop::Environment.dir, 'bin/crawl.rb')
  end
end
