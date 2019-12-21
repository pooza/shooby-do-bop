module ShoobyDoBop
  class Environment < Ginseng::Environment
    def self.name
      return File.basename(dir)
    end

    def self.dir
      return ShoobyDoBop.dir
    end
  end
end
