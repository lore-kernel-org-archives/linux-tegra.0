From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 4/4] host1x: MIPI: Set MIPI_CAL_BIAS_PAD_CFG1 register
Date: Wed, 10 Sep 2014 10:52:05 -0400
Message-ID: <1410360725-4286-5-git-send-email-seanpaul@chromium.org>
References: <1410360725-4286-1-git-send-email-seanpaul@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410360725-4286-1-git-send-email-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

During calibration, sets the "internal reference level for drive
pull-down" to the value specified in the tegra TRM.

Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
	- Added field definition for PAD_DRV_DN_REF

 drivers/gpu/host1x/mipi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index e017f7f..c7d6819 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -67,6 +67,7 @@
 #define MIPI_CAL_BIAS_PAD_E_VCLAMP_REF	(1 << 0)
 
 #define MIPI_CAL_BIAS_PAD_CFG1		0x17
+#define MIPI_CAL_BIAS_PAD_DRV_DN_REF(x) (((x) & 0x7) << 16)
 
 #define MIPI_CAL_BIAS_PAD_CFG2		0x18
 #define MIPI_CAL_BIAS_PAD_PDVREG	(1 << 1)
@@ -245,6 +246,9 @@ int tegra_mipi_calibrate(struct tegra_mipi_device *device)
 	value |= MIPI_CAL_BIAS_PAD_E_VCLAMP_REF;
 	tegra_mipi_writel(device->mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
 
+	tegra_mipi_writel(device->mipi, MIPI_CAL_BIAS_PAD_DRV_DN_REF(2),
+			MIPI_CAL_BIAS_PAD_CFG1);
+
 	value = tegra_mipi_readl(device->mipi, MIPI_CAL_BIAS_PAD_CFG2);
 	value &= ~MIPI_CAL_BIAS_PAD_PDVREG;
 	tegra_mipi_writel(device->mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
-- 
2.0.0
