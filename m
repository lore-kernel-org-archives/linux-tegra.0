From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] MAINTAINERS: tegra: remove Olof/Colin, add device tree files
Date: Tue,  4 Sep 2012 16:34:38 -0600
Message-ID: <1346798078-28682-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

At Linux Plumbers conference, Olof and Colin both told me to remove them
from the MAINTAINERS file. Thank you both very much for all the help with
Tegra!

Also, include all Tegra-related device-tree files in the file list.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 MAINTAINERS |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ae54678..7c9fdb0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6776,14 +6776,13 @@ F:	drivers/net/team/
 F:	include/linux/if_team.h
 
 TEGRA SUPPORT
-M:	Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
-M:	Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
 M:	Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
 L:	linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 Q:	http://patchwork.ozlabs.org/project/linux-tegra/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git
 S:	Supported
 F:	arch/arm/mach-tegra
+F:	arch/arm/boot/dts/tegra*
 F:	arch/arm/configs/tegra_defconfig
 
 TEHUTI ETHERNET DRIVER
-- 
1.7.0.4
