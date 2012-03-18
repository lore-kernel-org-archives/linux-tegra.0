From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] ARM: tegra: update main repo and add patchwork
Date: Sun, 18 Mar 2012 10:44:11 -0700
Message-ID: <1332092651-25346-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Stephen is taking over the main tegra repo, so change the entry to point at his tree on kernel.org

Also, document the patchwork URL.

Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
---


Arnd, I applied the previous Tegra maintainer patch to next/maintainers
directly, so this should just go on top of there.


Thanks!


-Olof


 MAINTAINERS |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 187d855..a23a635 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6515,7 +6515,8 @@ M:	Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
 M:	Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
 M:	Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
 L:	linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git
+Q:	http://patchwork.ozlabs.org/project/linux-tegra/list/
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git
 S:	Supported
 F:	arch/arm/mach-tegra
 
-- 
1.7.10.rc1
