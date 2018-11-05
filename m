From: Wei Ni <wni@nvidia.com>
Subject: [PATCH v1 4/4] thermal: tegra: fix coverity defect
Date: Mon, 5 Nov 2018 17:32:34 +0800
Message-ID: <1541410354-19090-5-git-send-email-wni@nvidia.com>
References: <1541410354-19090-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541410354-19090-1-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org
Cc: rui.zhang@intel.com, edubezval@gmail.com, linux-kernel@vger.kernel.org, Wei Ni <wni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Fix dereference dev before null check.

Signed-off-by: Wei Ni <wni@nvidia.com>
---
 drivers/thermal/tegra/soctherm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
index 3042837364e8..96527df91f2a 100644
--- a/drivers/thermal/tegra/soctherm.c
+++ b/drivers/thermal/tegra/soctherm.c
@@ -397,7 +397,7 @@ static int throttrip_program(struct device *dev,
 			     struct soctherm_throt_cfg *stc,
 			     int trip_temp)
 {
-	struct tegra_soctherm *ts = dev_get_drvdata(dev);
+	struct tegra_soctherm *ts;
 	int temp, cpu_throt, gpu_throt;
 	unsigned int throt;
 	u32 r, reg_off;
@@ -405,6 +405,8 @@ static int throttrip_program(struct device *dev,
 	if (!sg || !stc || !stc->init)
 		return -EINVAL;
 
+	ts = dev_get_drvdata(dev);
+
 	temp = enforce_temp_range(dev, trip_temp) / ts->soc->thresh_grain;
 
 	/* Hardcode LIGHT on LEVEL1 and HEAVY on LEVEL2 */
-- 
2.7.4
