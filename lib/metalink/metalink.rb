require File.join(File.dirname(__FILE__), "file")

module Metalink
  class Metalink
    
    def initialize
      @version = 3
      @files = []
    end
    
    def add_file(path, urls)
      @files << MetalinkFile.new(path, urls)
    end
    
    def to_s
      out = ""
      out << "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
      out << "<metalink version=\"3.0\"\n  xmlns=\"http://www.metalinker.org/\"\n  generator=\"https://github.com/timsjoberg/metalink-ruby/\"\n  >\n<files>\n"
      @files.each do |file|
        out << file.to_s
      end
      out << "</files>\n</metalink>"
    end
    
  end
end
