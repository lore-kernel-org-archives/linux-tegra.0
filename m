From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V3 2/2] MAINTAINERS: update Tegra section to capture all Tegra files
Date: Mon, 11 Feb 2013 16:40:16 -0700
Message-ID: <1360626016-23332-2-git-send-email-swarren@wwwdotorg.org>
References: <1360626016-23332-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360626016-23332-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The intent is to ensure that all Tegra-related patches are sent to the
linux-tegra@ mailing list, so people can keep up-to-date on all misc
driver changes.

Doing this with a keyword is far simpler and more compact than listing
all Tegra-related drivers, even if wildcards were used.

Words such as integrate or integrator are common. Ensure the character
right before "tegra" isn't a-z (case-insensitive), to make sure the
keyword doesn't match those.

The only files that the keyword doesn't match are the NVEC driver. Add
the linux-tegra mailing list to the NVEC entry to solve this.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
V2: Edit NVEC entry too.

 MAINTAINERS |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b98c89b..0cfb670 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7531,6 +7531,7 @@ STAGING - NVIDIA COMPLIANT EMBEDDED CONTROLLER INTERFACE (nvec)
 M:	Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>
 M:	Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
 L:	ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org (moderated for non-subscribers)
+L:	linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 S:	Maintained
 F:	drivers/staging/nvec/
 
@@ -7829,9 +7830,7 @@ L:	linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 Q:	http://patchwork.ozlabs.org/project/linux-tegra/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git
 S:	Supported
-F:	arch/arm/mach-tegra
-F:	arch/arm/boot/dts/tegra*
-F:	arch/arm/configs/tegra_defconfig
+K:	(?i)[^a-z]tegra
 
 TEHUTI ETHERNET DRIVER
 M:	Andy Gospodarek <andy-QlMahl40kYEqcZcGjlUOXw@public.gmane.org>
-- 
1.7.10.4
