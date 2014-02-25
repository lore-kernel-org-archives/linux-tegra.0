From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: tegra: Export I/O rail functions
Date: Tue, 25 Feb 2014 17:08:36 +0100
Message-ID: <1393344516-5660-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The I/O rail functions can be used by drivers that are buildable as
modules. Exporting the functions makes sure that they're available.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/powergate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-tegra/powergate.c b/arch/arm/mach-tegra/powergate.c
index 3d0c537d9b94..4cefc5cd6bed 100644
--- a/arch/arm/mach-tegra/powergate.c
+++ b/arch/arm/mach-tegra/powergate.c
@@ -484,6 +484,7 @@ int tegra_io_rail_power_on(int id)
 
 	return 0;
 }
+EXPORT_SYMBOL(tegra_io_rail_power_on);
 
 int tegra_io_rail_power_off(int id)
 {
@@ -511,3 +512,4 @@ int tegra_io_rail_power_off(int id)
 
 	return 0;
 }
+EXPORT_SYMBOL(tegra_io_rail_power_off);
-- 
1.8.4.2
