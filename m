From: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] soc/tegra: pmc: Fix incorrect DPD request
Date: Wed, 10 Aug 2016 13:23:28 +0800
Message-ID: <1470806608-23231-1-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Reading the DPD_REQ & DPD2_REQ registers returns the previous requests.
If we sets the current request bit with the returned value, then other
pads will be turned on or off unexpectedly.

Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Hi,

I found this issue when debugging one HDMI issue which only happened
after LP0 on Tegra124 chromebook. I did not test this patch on any
upstream platforms due to lack of setup, but it did pass Nvidia
internal EMIT verification.

Thanks,
Vince


 drivers/soc/tegra/pmc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 71c834f3847e..43c01a85334c 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -979,8 +979,7 @@ int tegra_io_rail_power_on(unsigned int id)
 
 	mask = 1 << bit;
 
-	value = tegra_pmc_readl(request);
-	value |= mask;
+	value = mask;
 	value &= ~IO_DPD_REQ_CODE_MASK;
 	value |= IO_DPD_REQ_CODE_OFF;
 	tegra_pmc_writel(value, request);
@@ -1016,8 +1015,7 @@ int tegra_io_rail_power_off(unsigned int id)
 
 	mask = 1 << bit;
 
-	value = tegra_pmc_readl(request);
-	value |= mask;
+	value = mask;
 	value &= ~IO_DPD_REQ_CODE_MASK;
 	value |= IO_DPD_REQ_CODE_ON;
 	tegra_pmc_writel(value, request);
-- 
2.7.4
