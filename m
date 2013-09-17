From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] MAINTAINERS: Tegra updates, and driver ownership
Date: Tue, 17 Sep 2013 10:11:34 -0600
Message-ID: <1379434294-10128-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

=46rom: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Overhaul of MAINTAINERS for Tegra. This adds Thierry as a Tegra core
maintainer, and adds specific entries for most individual Tegra-specifi=
c
device drivers, pointing at relevant people. The tegradrm section is
updated to be Supported since Thierry is now employed to work on this.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 MAINTAINERS | 62 +++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++--
 1 file changed, 60 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 81415f6..75397a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2802,7 +2802,7 @@ M:	Terje Bergstr=C3=B6m <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
 L:	dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
 L:	linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 T:	git git://anongit.freedesktop.org/tegra/linux.git
-S:	Maintained
+S:	Supported
 F:	drivers/gpu/host1x/
 F:	include/uapi/drm/tegra_drm.h
 F:	Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
@@ -8269,14 +8269,72 @@ L:	linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 S:	Maintained
 F:	drivers/media/rc/ttusbir.c
=20
-TEGRA SUPPORT
+TEGRA ARCHITECTURE SUPPORT
 M:	Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
+M:	Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 L:	linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 Q:	http://patchwork.ozlabs.org/project/linux-tegra/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-teg=
ra.git
 S:	Supported
 N:	[^a-z]tegra
=20
+TEGRA ASOC DRIVER
+M:	Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
+S:	Supported
+F:	sound/soc/tegra/
+
+TEGRA CLOCK DRIVER
+M:	Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+M:	Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+S:	Supported
+F:	drivers/clk/tegra/
+
+TEGRA DMA DRIVER
+M:	Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+S:	Supported
+F:	drivers/dma/tegra20-apb-dma.c
+
+TEGRA GPIO DRIVER
+M:	Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
+S:	Supported
+F:	drivers/gpio/gpio-tegra.c
+
+TEGRA I2C DRIVER
+M:	Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+S:	Supported
+F:	drivers/i2c/busses/i2c-tegra.c
+
+TEGRA IOMMU DRIVERS
+M:	Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+S:	Supported
+F:	drivers/iommu/tegra*
+
+TEGRA KBC DRIVER
+M:	Rakesh Iyer <riyer-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+M:	Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+S:	Supported
+F:	drivers/input/keyboard/tegra-kbc.c
+
+TEGRA PINCTRL DRIVER
+M:	Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
+S:	Supported
+F:	drivers/pinctrl/pinctrl-tegra*
+
+TEGRA PWM DRIVER
+M:	Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+S:	Supported
+F:	drivers/pwm/pwm-tegra.c
+
+TEGRA SERIAL DRIVER
+M:	Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+S:	Supported
+F:	drivers/tty/serial/serial-tegra.c
+
+TEGRA SPI DRIVER
+M:	Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+S:	Supported
+F:	drivers/spi/spi-tegra*
+
 TEHUTI ETHERNET DRIVER
 M:	Andy Gospodarek <andy-QlMahl40kYEqcZcGjlUOXw@public.gmane.org>
 L:	netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
--=20
1.8.1.5
