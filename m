From: Lukas Bulwahn <lukas.bulwahn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] MAINTAINERS: adjust entries to moving CEC platform drivers
Date: Sat, 18 Apr 2020 11:36:30 +0200
Message-ID: <20200418093630.6149-1-lukas.bulwahn@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mauro Carvalho Chehab <mchehab+huawei-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hverkuil-cisco-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Guenter Roeck <groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Ettore Chimenti <ek5.chimenti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-stm32-XDFAJ8BFU24N7RejjzZ/Li2xQDfSxrLKVpNB7YpNyf8@public.gmane.org, linux-tegra@vger
List-Id: linux-tegra@vger.kernel.org

Commit 4be5e8648b0c ("media: move CEC platform drivers to a separate
directory") moved various files into a new directory structure, but did
not adjust the entries in MAINTAINERS.

Since then, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches F: drivers/media/platform/s5p-cec/
  warning: no file matches F: drivers/media/platform/tegra-cec/
  warning: no file matches F: drivers/media/platform/cec-gpio/
  warning: no file matches F: drivers/media/platform/meson/ao-cec-g12a.c
  warning: no file matches F: drivers/media/platform/meson/ao-cec.c
  warning: no file matches F: drivers/media/platform/seco-cec/seco-cec.c
  warning: no file matches F: drivers/media/platform/seco-cec/seco-cec.h
  warning: no file matches F: drivers/media/platform/sti/cec/

Update the MAINTAINERS entries to the new file locations.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Mauro, please pick this non-urgent minor clean-up patch on top of the
CEC platform driver moves.

applies cleanly on next-20200417

 MAINTAINERS | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3083282134de..a708773e1af7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2373,7 +2373,7 @@ L:	linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (moderated for non-subscribers)
 L:	linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/s5p-cec.txt
-F:	drivers/media/platform/s5p-cec/
+F:	drivers/media/cec/platform/s5p/
 
 ARM/SAMSUNG S5P SERIES JPEG CODEC SUPPORT
 M:	Andrzej Pietrasiewicz <andrzejtp2010-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
@@ -2518,7 +2518,7 @@ L:	linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 L:	linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/tegra-cec.txt
-F:	drivers/media/platform/tegra-cec/
+F:	drivers/media/cec/platform/tegra/
 
 ARM/TETON BGA MACHINE SUPPORT
 M:	"Mark F. Brown" <mark.brown314-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
@@ -3932,7 +3932,7 @@ S:	Supported
 W:	http://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/cec-gpio.txt
-F:	drivers/media/platform/cec-gpio/
+F:	drivers/media/cec/platform/cec-gpio/
 
 CELL BROADBAND ENGINE ARCHITECTURE
 M:	Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
@@ -11027,8 +11027,7 @@ S:	Supported
 W:	http://linux-meson.com/
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
-F:	drivers/media/platform/meson/ao-cec-g12a.c
-F:	drivers/media/platform/meson/ao-cec.c
+F:	drivers/media/cec/platform/meson/
 
 MESON NAND CONTROLLER DRIVER FOR AMLOGIC SOCS
 M:	Liang Yang <liang.yang-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
@@ -15063,8 +15062,7 @@ F:	drivers/mmc/host/sdricoh_cs.c
 SECO BOARDS CEC DRIVER
 M:	Ettore Chimenti <ek5.chimenti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 S:	Maintained
-F:	drivers/media/platform/seco-cec/seco-cec.c
-F:	drivers/media/platform/seco-cec/seco-cec.h
+F:	drivers/media/cec/platform/seco/
 
 SECURE COMPUTING
 M:	Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
@@ -16089,7 +16087,7 @@ STI CEC DRIVER
 M:	Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/stih-cec.txt
-F:	drivers/media/platform/sti/cec/
+F:	drivers/media/cec/platform/sti/
 
 STK1160 USB VIDEO CAPTURE DRIVER
 M:	Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
-- 
2.17.1
