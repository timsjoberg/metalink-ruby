require 'digest/md5'
require 'digest/sha2'
require 'digest/sha1'

module Metalink
  class MetalinkFile
    
    def initialize(path, urls)
      @path = path
      @urls = urls
      @piece_length = 2097152
    end
    
    def to_s
      out = ""
      out << "	<file name=\"#{File.basename(@path)}\">\n"
      out << "		<size>#{File.size?(@path)}</size>\n"
      out << "		<verification>\n"
      
      md5_digest = Digest::MD5.new
      sha256_digest = Digest::SHA2.new
      sha1_hashes = []
      f = File.open(@path)
      while chunk = f.read(@piece_length)
        md5_digest << chunk
        sha256_digest << chunk
        sha1_hashes << Digest::SHA1.hexdigest(chunk)
      end
      f.close
      
      out << "			<hash type=\"md5\">#{md5_digest.hexdigest}</hash>\n"
      out << "			<hash type=\"sha256\">#{sha256_digest.hexdigest}</hash>\n"
      
      out << "			<pieces length=\"#{@piece_length}\" type=\"sha1\">\n"
      sha1_hashes.each_with_index do |hash, index|
        out << "				<hash piece=\"#{index}\">#{hash}</hash>\n"
      end
      out << "			</pieces>\n"
      
      out << "		</verification>\n"
      out << "		<resources>\n"
      
      @urls.each do |url_hash|
        out << "			<url type=\"#{url_hash[:type]}\">#{url_hash[:url]}</url>\n"
      end
      
      out << "		</resources>\n	</file>\n"
      
      out
    end
    
  end
end
