From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 4/4] host1x: mipi: Set MIPI_CAL_BIAS_PAD_CFG1 register
Date: Thu,  7 Aug 2014 02:11:47 -0400
Message-ID: <1407391907-19488-5-git-send-email-seanpaul@chromium.org>
References: <1407391907-19488-1-git-send-email-seanpaul@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407391907-19488-1-git-send-email-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

During calibration, set the "internal reference level for drive
pull-down" to the value specified in the tegra TRM.

Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 drivers/gpu/host1x/mipi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index 80578dc..84ed422 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -235,6 +235,8 @@ int tegra_mipi_calibrate(struct tegra_mipi_device *device)
 	value |= MIPI_CAL_BIAS_PAD_E_VCLAMP_REF;
 	tegra_mipi_writel(device->mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
 
+	tegra_mipi_writel(device->mipi, 0x20000, MIPI_CAL_BIAS_PAD_CFG1);
+
 	value = tegra_mipi_readl(device->mipi, MIPI_CAL_BIAS_PAD_CFG2);
 	value &= ~MIPI_CAL_BIAS_PAD_PDVREG;
 	tegra_mipi_writel(device->mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
-- 
2.0.0
