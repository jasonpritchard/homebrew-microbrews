class Serproxy < Formula
  homepage "http://www.lspace.nildram.co.uk/freeware.html"
  url "http://www.lspace.nildram.co.uk/files/serproxy-0.1.2.tar.gz"
  sha1 "ba60efc11f9e47cbb5e12d0f617dfcbb38f05a7a"

  def install
    system "make"
    bin.install "serproxy"
  end

end
