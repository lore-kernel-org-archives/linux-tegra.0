From: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: [PATCH] ARM: tegra: fix missing common.h include
Date: Wed,  8 Jun 2016 18:01:49 +0100
Message-ID: <1465405309-19011-1-git-send-email-ben.dooks@codethink.co.uk>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org
Cc: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Fix two missing function protoypes by including common.h
where they are defined. Fixes:

arch/arm/mach-tegra/hotplug.c:24:5: warning: symbol 'tegra_cpu_kill' was not declared. Should it be static?
arch/arm/mach-tegra/hotplug.c:40:6: warning: symbol 'tegra_cpu_die' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
---
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 arch/arm/mach-tegra/hotplug.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-tegra/hotplug.c b/arch/arm/mach-tegra/hotplug.c
index 1b12989..8ec7078 100644
--- a/arch/arm/mach-tegra/hotplug.c
+++ b/arch/arm/mach-tegra/hotplug.c
@@ -17,6 +17,7 @@
 
 #include <asm/smp_plat.h>
 
+#include "common.h"
 #include "sleep.h"
 
 static void (*tegra_hotplug_shutdown)(void);
-- 
2.8.1
