class SigrokFirmwareFx2lafw < Formula
  homepage "http://sigrok.org"
  url "http://sigrok.org/download/source/sigrok-firmware-fx2lafw/sigrok-firmware-fx2lafw-0.1.2.tar.gz"
  sha256 "85c658f851fd90089382756b4c5f0326f96d630a0ad5637455a84a4a058b3572"

  head do
    url "git://sigrok.org/sigrok-firmware-fx2lafw", :shallow => false
    depends_on "glib"
    depends_on "libtool" => :build
    depends_on "autoconf" => :build
    depends_on "automake" => :build
  end
  
  depends_on 'sdcc'
  depends_on 'pkg-config' => :build
  depends_on "libsigrokdecode"

  def install
    system "./autogen.sh" if build.head?
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
