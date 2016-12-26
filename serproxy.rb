class Serproxy < Formula
  homepage "http://www.lspace.nildram.co.uk/freeware.html"
  url "http://www.lspace.nildram.co.uk/files/serproxy-0.1.2.tar.gz"
  sha256 "ace8269b9481ba73fbcf85a61089b1f9fede4e28249756618a2168763f37c174"

  def install
    system "make"
    bin.install "serproxy"
  end

end
