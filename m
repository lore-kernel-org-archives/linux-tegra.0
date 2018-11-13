From: Wei Ni <wni@nvidia.com>
Subject: [PATCH v2 1/3] thermal: tegra: continue if sensor register fails
Date: Tue, 13 Nov 2018 18:06:05 +0800
Message-ID: <1542103567-5521-2-git-send-email-wni@nvidia.com>
References: <1542103567-5521-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542103567-5521-1-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org
Cc: rui.zhang@intel.com, edubezval@gmail.com, linux-kernel@vger.kernel.org, Wei Ni <wni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Don't bail when a sensor fails to register with the
thermal zone and allow other sensors to register.
This allows other sensors to register with thermal
framework even if one sensor fails registration.

Signed-off-by: Wei Ni <wni@nvidia.com>
---
 drivers/thermal/tegra/soctherm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
index ed28110a3535..a824d2e63af3 100644
--- a/drivers/thermal/tegra/soctherm.c
+++ b/drivers/thermal/tegra/soctherm.c
@@ -1370,9 +1370,9 @@ static int tegra_soctherm_probe(struct platform_device *pdev)
 							 &tegra_of_thermal_ops);
 		if (IS_ERR(z)) {
 			err = PTR_ERR(z);
-			dev_err(&pdev->dev, "failed to register sensor: %d\n",
-				err);
-			goto disable_clocks;
+			dev_warn(&pdev->dev, "failed to register sensor %s: %d\n",
+				 soc->ttgs[i]->name, err);
+			continue;
 		}
 
 		zone->tz = z;
@@ -1434,6 +1434,8 @@ static int __maybe_unused soctherm_resume(struct device *dev)
 		struct thermal_zone_device *tz;
 
 		tz = tegra->thermctl_tzs[soc->ttgs[i]->id];
+		if (!tz)
+			continue;
 		err = tegra_soctherm_set_hwtrips(dev, soc->ttgs[i], tz);
 		if (err) {
 			dev_err(&pdev->dev,
-- 
2.7.4
