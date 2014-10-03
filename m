From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V2 1/2] MAINTAINERS: add Alexandre Courbot for Tegra
Date: Fri,  3 Oct 2014 09:50:32 -0600
Message-ID: <1412351433-4003-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I'd like to propose Alexandre Courbot as an additional Tegra maintainer.
He's been working on a variety of Tegra-related code for a while, and
is now officially tasked with working on upstream support.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
--
v2:
* Use Alexandre's full name.
* Use a non-NVIDIA email address to avoid Exchange Server patch corruption.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 37054306dc9f..2210990fc3c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9008,6 +9008,7 @@ F:	drivers/media/rc/ttusbir.c
 TEGRA ARCHITECTURE SUPPORT
 M:	Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
 M:	Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+M:	Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 L:	linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 Q:	http://patchwork.ozlabs.org/project/linux-tegra/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git
-- 
1.9.1
