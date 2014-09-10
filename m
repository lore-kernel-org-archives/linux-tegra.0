From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 2/4] host1x: MIPI: Preserve the contents of MIPI_CAL_CTRL
Date: Wed, 10 Sep 2014 10:52:03 -0400
Message-ID: <1410360725-4286-3-git-send-email-seanpaul@chromium.org>
References: <1410360725-4286-1-git-send-email-seanpaul@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410360725-4286-1-git-send-email-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

By paving the CTRL reg value, the current code changes
MIPI_CAL_PRESCALE ("Auto-cal calibration step prescale")
from 1us to 0.1us (val=0). In the description for phy's noise
filter (MIPI_CAL_NOISE_FLT), the TRM states that if the value
of the prescale is 0 (or 0.1us), the filter should be set
between 2-5. However, the current code sets it to 0.

For now, let's keep the prescale and filter values as-is, which
is most likely the power-on-reset values of 0x2 and 0xa, respectively.

Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
	- Improved the commit description

 drivers/gpu/host1x/mipi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index 9882ea1..0f3b77e 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -208,7 +208,9 @@ int tegra_mipi_calibrate(struct tegra_mipi_device *device)
 		tegra_mipi_writel(device->mipi, value, modules[i].reg);
 	}
 
-	tegra_mipi_writel(device->mipi, MIPI_CAL_CTRL_START, MIPI_CAL_CTRL);
+	value = tegra_mipi_readl(device->mipi, MIPI_CAL_CTRL);
+	value |= MIPI_CAL_CTRL_START;
+	tegra_mipi_writel(device->mipi, value, MIPI_CAL_CTRL);
 
 	err = tegra_mipi_wait(device->mipi);
 
-- 
2.0.0
