class IOAdapter
    def self.write(str)
      print str
      return str
    end
  
    def self.writeln(str)
      puts str
    end
  
    def self.read
      gets.chomp
    end
  end
  