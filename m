From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] MAINTAINERS: add keyword "tegra" to Tegra section
Date: Fri,  8 Feb 2013 13:04:51 -0700
Message-ID: <1360353891-24210-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The intent is to ensure that all Tegra-related patches are sent to the
linux-tegra@ mailing list, so people can keep up-to-date on all misc
driver changes.

Doing this with a keyword is far simpler and more compact than listing
all Tegra-related drivers, even if wildcards were used.

Words such as integrate or integrator are common. Use a negative look-
behind assertion to make sure the keyword doesn't match those.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 MAINTAINERS |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 972fd51..ebd3c64 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7850,9 +7850,7 @@ L:	linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 Q:	http://patchwork.ozlabs.org/project/linux-tegra/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git
 S:	Supported
-F:	arch/arm/mach-tegra
-F:	arch/arm/boot/dts/tegra*
-F:	arch/arm/configs/tegra_defconfig
+K:	(?<!in)tegra
 
 TEHUTI ETHERNET DRIVER
 M:	Andy Gospodarek <andy-QlMahl40kYEqcZcGjlUOXw@public.gmane.org>
-- 
1.7.10.4
