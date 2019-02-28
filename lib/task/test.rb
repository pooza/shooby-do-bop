namespace :shooby do
  task :test do
    ENV['TEST'] = ShoobyDoBop::Package.name
    require 'test/unit'
    Dir.glob(File.join(ShoobyDoBop::Environment.dir, 'test/*')).each do |t|
      require t
    end
  end
end
