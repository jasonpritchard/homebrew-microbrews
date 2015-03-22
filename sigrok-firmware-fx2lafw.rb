class SigrokFirmwareFx2lafw < Formula
  homepage "http://sigrok.org"
  url "http://sigrok.org/download/source/sigrok-firmware-fx2lafw/sigrok-firmware-fx2lafw-0.1.2.tar.gz"
  sha1 "5f38bebc6cba9be0da34be5d17f505c01355a519"

  head do
    url "git://sigrok.org/sigrok-firmware-fx2lafw", :shallow => false
    depends_on "glib"
    depends_on "libtool" => :build
    depends_on "autoconf" => :build
    depends_on "automake" => :build
  end

  depends_on 'pkg-config' => :build
  depends_on "libsigrok"

  def install
    system "./autogen.sh" if build.head?
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
