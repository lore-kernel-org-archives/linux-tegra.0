From: Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
Subject: [tegrarcm PATCH] configure.ac: Request at least libusb 1.0.9
Date: Wed,  8 Apr 2015 18:55:12 +0200
Message-ID: <1428512112-15430-1-git-send-email-tklauser@distanz.ch>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

tegrarcm needs at least libusb 1.0.9 which introduces libusb_error_name.
Otherwise the build fails with the following linker error:

usb.o: In function `usb_read':
.../tegrarcm/src/usb.c:260: undefined reference to `libusb_error_name'
usb.o: In function `usb_write':
.../tegrarcm/src/usb.c:233: undefined reference to `libusb_error_name'

Signed-off-by: Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
---
 configure.ac | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index c95a0ec..51ac73d 100644
--- a/configure.ac
+++ b/configure.ac
@@ -17,7 +17,7 @@ AC_CHECK_LIB([pthread],
 	[pthread_create],
 	[HAVE_PTHREAD=1],
 	[AC_MSG_ERROR([libpthread is not installed.])])
-PKG_CHECK_MODULES([LIBUSB], [libusb-1.0])
+PKG_CHECK_MODULES([LIBUSB], [libusb-1.0 >= 1.0.9])
 AC_LANG(C++)
 SAVED_LDFLAGS=$LDFLAGS
 LDFLAGS="$LDFLAGS -lcryptopp -lpthread"
-- 
2.2.2
