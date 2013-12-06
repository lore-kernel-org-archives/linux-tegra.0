From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] ARM: tegra: Export tegra_powergate_remove_clamping()
Date: Fri,  6 Dec 2013 16:49:56 +0100
Message-ID: <1386344996-8179-2-git-send-email-treding@nvidia.com>
References: <1386344996-8179-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386344996-8179-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Drivers can use the tegra_powergate_remove_clamping() API during
initialization. In order to allow such drivers to be built as modules,
export the symbol.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/powergate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-tegra/powergate.c b/arch/arm/mach-tegra/powergate.c
index 3724679fefce..b988411cedbc 100644
--- a/arch/arm/mach-tegra/powergate.c
+++ b/arch/arm/mach-tegra/powergate.c
@@ -178,6 +178,7 @@ int tegra_powergate_remove_clamping(int id)
 
 	return 0;
 }
+EXPORT_SYMBOL(tegra_powergate_remove_clamping);
 
 /* Must be called with clk disabled, and returns with clk enabled */
 int tegra_powergate_sequence_power_up(int id, struct clk *clk)
-- 
1.8.4.2
