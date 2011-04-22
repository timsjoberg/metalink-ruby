#Metalink Ruby

Metalink Ruby is a pure ruby library which, at the moment, requires no other gems and can spit out a metalink file with any number of files in it, each with any number of links, and uses md5, sha256 and sha1pieces for verification. At the moment this is completely unconfigurable and to add a torrent magnet link you would have to create it yourself. This might change in the future. It also happens to be ever so slightly faster than the metalink binary. (with ruby 1.8.7)

Usage

> t = Metalink::Metalink.new
> t.add_file("/path/to/some/file.txt", [{ :type => "http", :url => "http://example.com/some/file.txt" }]
> puts t.to_s

Add file takes 2 parameters. The first is the local path to the file. The second is an array of hashes, each hash being one url, with a type and a full url path
