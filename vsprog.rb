class Vsprog < Formula
  homepage "http://www.versaloon.com/"
  url "http://vsprog.googlecode.com/svn/trunk", :using => :svn, :revision => "r1587"
  version "trunk"

  depends_on 'libxml2'
  depends_on 'automake' => :build
  depends_on 'autoconf' => :build
  #depends_on 'gcc' => :build
  
  # Fix for mac
  patch :DATA

  def install
    system "chmod +x bootstrap"
    system "chmod +x *.sh"
    system "./bootstrap -I/usr/local/opt/libxml2/share/aclocal"
    system "./configure", "--prefix=#{prefix}", "--enable-maintainer-mode", "--enable-release"
    system "make"
    system "make", "install"
  end

end

__END__
Index: bootstrap
===================================================================
--- a/bootstrap	(revision 1587)
+++ b/bootstrap	(working copy)
@@ -3,7 +3,8 @@

 # bootstrap the autotools
 set -x
-aclocal
+#aclocal -I/usr/local/opt/libxml2/share/aclocal
+aclocal $@
 autoconf
 autoheader
 automake --foreign --add-missing --copy
Index: src/programmer/interfaces/versaloon/versaloon_libusb.h
===================================================================
--- a/src/programmer/interfaces/versaloon/versaloon_libusb.h	(revision 1587)
+++ b/src/programmer/interfaces/versaloon/versaloon_libusb.h	(working copy)
@@ -1,4 +1,4 @@
-#ifndef __VERSALOON_LIBUSB_H_INCLLUDED__
+#ifndef __VERSALOON_LIBUSB_H_INCLUDED__
 #define __VERSALOON_LIBUSB_H_INCLUDED__

 extern struct interfaces_comm_t versaloon_usb_comm;
Index: vsf/interfaces/cpu/pc/app_io.h
===================================================================
--- a/vsf/interfaces/cpu/pc/app_io.h	(revision 1587)
+++ b/vsf/interfaces/cpu/pc/app_io.h	(working copy)
@@ -28,8 +28,12 @@
 #define FEOF							feof
 #define REWIND							rewind
 #define FFLUSH							fflush
+
+#if ! defined(__APPLE__)
 #define FREAD							fread
 #define FWRITE							fwrite
+#endif
+
 #define FSEEK							fseek
 #define FTELL							ftell
 #define FVALID(f)						(f != NULL)
Index: configure.in
===================================================================
--- a/configure.in	(revision 1587)
+++ b/configure.in	(working copy)
@@ -97,12 +97,18 @@
 AM_CONDITIONAL(IS_MINGW, test $is_mingw = yes)
 AM_CONDITIONAL(IS_WIN32, test $is_win32 = yes)

+AH_TEMPLATE([VSF_UNUSED])
+AC_DEFINE([VSF_UNUSED(x)], [x])
+
 GCC_WARNINGS="-Wall -Wstrict-prototypes -Wformat-security"
 GCC_WARNINGS="${GCC_WARNINGS} -Wno-unused-parameter -Wno-missing-field-initializers"
 GCC_WARNINGS="${GCC_WARNINGS} -Werror -Wextra"
 GCC_WARNINGS="${GCC_WARNINGS} -Wbad-function-cast"
-GCC_WARNINGS="${GCC_WARNINGS} -Wcast-align"
 GCC_WARNINGS="${GCC_WARNINGS} -Wredundant-decls"
+GCC_WARNINGS="${GCC_WARNINGS} -Wno-strncat-size"
+GCC_WARNINGS="${GCC_WARNINGS} -Wno-error=missing-field-initializers"
+GCC_WARNINGS="${GCC_WARNINGS} -Wno-error=tautological-pointer-compare -Wno-error=tautological-constant-out-of-range-compare"
+GCC_WARNINGS="${GCC_WARNINGS} -Wno-error=unused-const-variable"
 CFLAGS="$CFLAGS $GCC_WARNINGS $XML_CPPFLAGS"

 AC_MSG_CHECKING([for suffix of executable build tools])
Index: src/tools/hex/hex.c
===================================================================
--- a/src/tools/hex/hex.c	(revision 1587)
+++ b/src/tools/hex/hex.c	(working copy)
@@ -244,7 +244,7 @@
	uint16_t addr_high_orig, addr_tmp_big_endian;
	uint32_t tmp_addr;
 	
-	file_addr = file_addr;
+	file_addr = VSF_UNUSED(file_addr);
 	
	// write seg_addr
	seg_addr = ((seg_addr >> 8) & 0x000000FF) | ((seg_addr << 8) & 0x0000FF00);
Index: src/programmer/interfaces/versaloon/usbtoxxx/usbtoswd.c
===================================================================
--- a/src/programmer/interfaces/versaloon/usbtoxxx/usbtoswd.c	(revision 1587)
+++ b/src/programmer/interfaces/versaloon/usbtoxxx/usbtoswd.c	(working copy)
@@ -32,7 +32,7 @@
 {
 	struct usbtoxxx_pending_t *pending = (struct usbtoxxx_pending_t *)p;
 	
-	processed = processed;
+	processed = VSF_UNUSED(processed);
 	
 	if (pending->extra_data != NULL)
 	{
Index: src/tools/fileparser/fileparser.c
===================================================================
--- a/src/tools/fileparser/fileparser.c	(revision 1587)
+++ b/src/tools/fileparser/fileparser.c	(working copy)
@@ -247,7 +247,7 @@
 	REFERENCE_PARAMETER(remap);
 	
 	// seg_addr is not used in binary file
-	seg_addr = seg_addr;
+	seg_addr = VSF_UNUSED(seg_addr);
 	
 	// check
 	if (start_addr < file_addr)
