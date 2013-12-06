From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] ARM: tegra: Export tegra_powergate_power_off()
Date: Fri,  6 Dec 2013 16:49:55 +0100
Message-ID: <1386344996-8179-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This function can be used by drivers, which in turn may be built as
modules. Export the symbol so it is available to modules.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/powergate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-tegra/powergate.c b/arch/arm/mach-tegra/powergate.c
index c5c74925eb62..3724679fefce 100644
--- a/arch/arm/mach-tegra/powergate.c
+++ b/arch/arm/mach-tegra/powergate.c
@@ -132,6 +132,7 @@ int tegra_powergate_power_off(int id)
 
 	return tegra_powergate_set(id, false);
 }
+EXPORT_SYMBOL(tegra_powergate_power_off);
 
 int tegra_powergate_is_powered(int id)
 {
-- 
1.8.4.2
