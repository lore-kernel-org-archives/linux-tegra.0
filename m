From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/8] soc: tegra: pmc: Remove non-existing L2 partition for Tegra124
Date: Thu, 11 Feb 2016 18:03:19 +0000
Message-ID: <1455213806-21871-2-git-send-email-jonathanh@nvidia.com>
References: <1455213806-21871-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455213806-21871-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Tegra124 does not have an L2 power partition and the L2 cache is part of
the cluster 0 non-CPU (CONC) partition. Remove the L2 as a valid
partition for Tegra124. The TRM also shows that there is no L2 partition
for Tegra124.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/pmc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 88c7e506177e..922430322877 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -967,7 +967,6 @@ static const char * const tegra124_powergates[] = {
 	[TEGRA_POWERGATE_VENC] = "venc",
 	[TEGRA_POWERGATE_PCIE] = "pcie",
 	[TEGRA_POWERGATE_VDEC] = "vdec",
-	[TEGRA_POWERGATE_L2] = "l2",
 	[TEGRA_POWERGATE_MPE] = "mpe",
 	[TEGRA_POWERGATE_HEG] = "heg",
 	[TEGRA_POWERGATE_SATA] = "sata",
-- 
2.1.4
