From: Wei Ni <wni@nvidia.com>
Subject: [PATCH v2 2/3] thermal: tegra: remove unnecessary warnings
Date: Tue, 13 Nov 2018 18:06:06 +0800
Message-ID: <1542103567-5521-3-git-send-email-wni@nvidia.com>
References: <1542103567-5521-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542103567-5521-1-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org
Cc: rui.zhang@intel.com, edubezval@gmail.com, linux-kernel@vger.kernel.org, Wei Ni <wni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Convert warnings to info as not all platforms may
have all the thresholds and sensors enabled.

Signed-off-by: Wei Ni <wni@nvidia.com>
---
 drivers/thermal/tegra/soctherm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
index a824d2e63af3..161ef242bcca 100644
--- a/drivers/thermal/tegra/soctherm.c
+++ b/drivers/thermal/tegra/soctherm.c
@@ -550,7 +550,7 @@ static int tegra_soctherm_set_hwtrips(struct device *dev,
 
 	ret = tz->ops->get_crit_temp(tz, &temperature);
 	if (ret) {
-		dev_warn(dev, "thermtrip: %s: missing critical temperature\n",
+		dev_info(dev, "thermtrip: %s: missing critical temperature\n",
 			 sg->name);
 		goto set_throttle;
 	}
@@ -569,7 +569,7 @@ static int tegra_soctherm_set_hwtrips(struct device *dev,
 set_throttle:
 	ret = get_hot_temp(tz, &trip, &temperature);
 	if (ret) {
-		dev_warn(dev, "throttrip: %s: missing hot temperature\n",
+		dev_info(dev, "throttrip: %s: missing hot temperature\n",
 			 sg->name);
 		return 0;
 	}
@@ -600,7 +600,7 @@ static int tegra_soctherm_set_hwtrips(struct device *dev,
 	}
 
 	if (i == THROTTLE_SIZE)
-		dev_warn(dev, "throttrip: %s: missing throttle cdev\n",
+		dev_info(dev, "throttrip: %s: missing throttle cdev\n",
 			 sg->name);
 
 	return 0;
-- 
2.7.4
