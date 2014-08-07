From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 2/4] host1x: mipi: Preserve the contents of MIPI_CAL_CTRL
Date: Thu,  7 Aug 2014 02:11:45 -0400
Message-ID: <1407391907-19488-3-git-send-email-seanpaul@chromium.org>
References: <1407391907-19488-1-git-send-email-seanpaul@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407391907-19488-1-git-send-email-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Preserve the contents of MIPI_CAL_CTRL when starting mipi
calibration.

Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 drivers/gpu/host1x/mipi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index 4dd91fd..0af2892 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -215,7 +215,9 @@ int tegra_mipi_calibrate(struct tegra_mipi_device *device)
 		tegra_mipi_writel(device->mipi, value, modules[i].reg);
 	}
 
-	tegra_mipi_writel(device->mipi, MIPI_CAL_CTRL_START, MIPI_CAL_CTRL);
+	value = tegra_mipi_readl(device->mipi, MIPI_CAL_CTRL);
+	value |= MIPI_CAL_CTRL_START;
+	tegra_mipi_writel(device->mipi, value, MIPI_CAL_CTRL);
 
 	err = tegra_mipi_wait(device->mipi);
 
-- 
2.0.0
