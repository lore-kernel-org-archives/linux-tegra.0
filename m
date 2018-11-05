From: Wei Ni <wni@nvidia.com>
Subject: [PATCH v1 1/4] thermal: tegra: continue if sensor register fails
Date: Mon, 5 Nov 2018 17:32:31 +0800
Message-ID: <1541410354-19090-2-git-send-email-wni@nvidia.com>
References: <1541410354-19090-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541410354-19090-1-git-send-email-wni@nvidia.com>
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
 drivers/thermal/tegra/soctherm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
index ed28110a3535..b708300303ff 100644
--- a/drivers/thermal/tegra/soctherm.c
+++ b/drivers/thermal/tegra/soctherm.c
@@ -1370,9 +1370,9 @@ static int tegra_soctherm_probe(struct platform_device *pdev)
 							 &tegra_of_thermal_ops);
 		if (IS_ERR(z)) {
 			err = PTR_ERR(z);
-			dev_err(&pdev->dev, "failed to register sensor: %d\n",
+			dev_warn(&pdev->dev, "failed to register sensor: %d\n",
 				err);
-			goto disable_clocks;
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
